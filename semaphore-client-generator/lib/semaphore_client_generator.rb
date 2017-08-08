require "rubygems"
require "ostruct"
require "erb"
require "json"
require "byebug"
require "fileutils"
require "active_support/inflector"

require "semaphore_client_generator/operation"
require "semaphore_client_generator/entity"
require "semaphore_client_generator/code_file"
require "semaphore_client_generator/resource_holding"
require "semaphore_client_generator/resource"
require "semaphore_client_generator/specification"
require "semaphore_client_generator/version"

class SemaphoreClientGenerator
  class VersionFormatError < StandardError; end

  SPECIFICATION_PATH = "../api.json"
  VERSION_PATH = "../version"
  SOURCE_DIR = "client_source"
  OUTPUT_DIR = "output"

  def initialize(args = {})
    @specification_path = args[:specification_path] || SPECIFICATION_PATH
    @version_path = args[:version_path] || VERSION_PATH
    @source_dir = args[:source_dir] || SOURCE_DIR
    @output_dir = args[:output_dir] || OUTPUT_DIR
  end

  def generate
    clear_output_dir

    copy_static_files
    copy_gemspec

    generate_version
    generate_root
    generate_model
    generate_api
  end

  def clear_output_dir
    FileUtils.rm_rf(@output_dir)
    FileUtils.mkdir_p(@output_dir)
  end

  def copy_static_files
    paths = nil

    FileUtils.cd(@source_dir) do
      all_paths = (Dir.glob("**/*") + Dir.glob("**/.*")).select do |path|
        File.file?(path)
      end

      paths = all_paths.reject { |path| File.extname(path) == ".erb" }
    end

    paths.each do |path|
      FileUtils.mkdir_p(output_path(File.dirname(path)))

      FileUtils.cp(source_path(path), output_path(path))
    end
  end

  def copy_gemspec
    FileUtils.cp(
      source_path("semaphore_client._gemspec_"),
      output_path("semaphore_client.gemspec")
    )
  end

  def generate_version
    version = File.read(@version_path).delete("\n")

    raise VersionFormatError if /^[0-9]+.[0-9]+.[0-9]+$/.match(version).nil?

    code_file = CodeFile.new(
      source_path("lib/semaphore_client/version.rb.erb"),
      output_path("lib/semaphore_client")
    )

    code_file.generate("version", :version => version)
  end

  def generate_root
    code_file = CodeFile.new(
      source_path("lib/semaphore_client.rb.erb"),
      output_path("lib")
    )

    entity_info = entities.map do |entity|
      OpenStruct.new(:key => entity.key, :name => entity.name)
    end

    code_file.generate("semaphore_client", :entities => entity_info)
  end

  def generate_model
    code_file = CodeFile.new(
      source_path("lib/semaphore_client/model/model.rb.erb"),
      output_path("lib/semaphore_client/model")
    )

    entities.each do |entity|
      code_file.generate(entity.key, {
        :name => entity.name,
        :attributes => entity.attributes,
        :mutable_attributes => entity.mutable_attributes,
        :immutable_attributes => entity.immutable_attributes
      })
    end
  end

  def generate_api
    code_file = CodeFile.new(
      source_path("lib/semaphore_client/api/api.rb.erb"),
      output_path("lib/semaphore_client/api")
    )

    entities.each do |entity|
      code_file.generate(entity.key, {
        :key => entity.key,
        :name => entity.name,
        :methods => entity.methods
      })
    end
  end

  private

  def source_path(relative_path)
    "#{@source_dir}/#{relative_path}"
  end

  def output_path(relative_path)
    "#{@output_dir}/#{relative_path}"
  end

  def entities
    @entities ||= Specification.new(@specification_path).entities
  end
end
