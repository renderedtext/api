require "fileutils"
require "prmd"
require "prmd/rake_tasks/combine"
require "prmd/rake_tasks/verify"
require "prmd/rake_tasks/doc"

namespace :api do
  namespace :schema do
    task :generate do
      Rake::Task["api:schema:link"].execute
      Rake::Task["api:schema:combine"].execute
      Rake::Task["api:schema:verify"].execute
      Rake::Task["api:schema:doc"].execute
    end

    task :link do
      FileUtils.rm_rf("schema/schemata")
      FileUtils.mkdir_p("schema/schemata")

      Dir["entities/*.erb"].each do |filename|
        file = File.read(filename)

        schema = ERB.new(file).result(binding)

        output_file_name = File.basename(filename).gsub!(/\.erb$/, "")

        File.write("schema/schemata/#{output_file_name}", schema)
      end
    end

    Prmd::RakeTasks::Combine.new do |t|
      t.options[:meta] = "schema/meta.json"
      t.paths << "schema/schemata/"
      t.output_file = "static/schema.json"
    end

    Prmd::RakeTasks::Verify.new do |t|
      t.files << "static/schema.json"
    end

    Prmd::RakeTasks::Doc.new do |t|
      t.files = { "static/schema.json" => "static/api.md" }
    end

    def identity(*entities)
      url_encoded_identities = entities.map do |entity|
        "{(%2Fschemata%2F#{entity}%23%2Fdefinitions%2Fidentity)}"
      end

      url_encoded_identities.join("/")
    end
  end
end
