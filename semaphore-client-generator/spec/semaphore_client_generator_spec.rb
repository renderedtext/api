require "spec_helper"

RSpec.describe SemaphoreClientGenerator do
  let(:specification_path) { "specification.json" }
  let(:version_path) { "version" }
  let(:source_path) { "client_source" }
  let(:output_path) { "output" }

  subject do
    described_class.new(
      :specification_path => specification_path,
      :version_path => version_path,
      :source_path => source_path,
      :output_path => output_path
    )
  end

  describe "#generate" do
    before do
      allow(subject).to receive(:clear_output_dir)
      allow(subject).to receive(:copy_static_files)
      allow(subject).to receive(:copy_gemspec)
      allow(subject).to receive(:generate_version)
      allow(subject).to receive(:generate_root)
      allow(subject).to receive(:generate_model)
      allow(subject).to receive(:generate_api)
    end

    it "clears the output directory" do
      expect(subject).to receive(:clear_output_dir)

      subject.generate
    end

    it "copies static files" do
      expect(subject).to receive(:copy_static_files)

      subject.generate
    end

    it "copies the gemspec file" do
      expect(subject).to receive(:copy_gemspec)

      subject.generate
    end

    it "generates the version file" do
      expect(subject).to receive(:generate_version)

      subject.generate
    end

    it "generates the client root class" do
      expect(subject).to receive(:generate_root)

      subject.generate
    end

    it "generates the model classes" do
      expect(subject).to receive(:generate_model)

      subject.generate
    end

    it "generates the api classes" do
      expect(subject).to receive(:generate_api)

      subject.generate
    end
  end

  describe "#clear_output_dir" do
    before do
      allow(FileUtils).to receive(:rm_rf)
      allow(FileUtils).to receive(:mkdir_p)
    end

    it "removes the output directory" do
      expect(FileUtils).to receive(:rm_rf).with(output_path)

      subject.clear_output_dir
    end

    it "creates the output directory" do
      expect(FileUtils).to receive(:mkdir_p).with(output_path)

      subject.clear_output_dir
    end
  end

  describe "#copy_static_files" do
    let(:files) { ["dir0/dir1/file.rb", "dir0/dir2/file.rb.erb"] }

    before do
      allow(FileUtils).to receive(:cd).and_yield()
      allow(Dir).to receive(:glob).with("**/*").and_return(files)
      allow(Dir).to receive(:glob).with("**/.*").and_return([])
      allow(File).to receive(:file?).and_return(true)
      allow(FileUtils).to receive(:mkdir_p)
      allow(FileUtils).to receive(:cp)
    end

    context "file is .erb" do
      it "doesn't create the directory path" do
        expect(FileUtils).not_to receive(:mkdir_p).with("#{output_path}/#{File.dirname(files[1])}")

        subject.copy_static_files
      end

      it "doesn't copy the file" do
        expect(FileUtils).not_to receive(:cp).with("#{source_path}/#{files[1]}", "#{output_path}/#{files[1]}")

        subject.copy_static_files
      end
    end

    context "file is not .erb" do
      it "creates the directory path" do
        expect(FileUtils).to receive(:mkdir_p).with("#{output_path}/#{File.dirname(files[0])}")

        subject.copy_static_files
      end

      it "copies the file" do
        expect(FileUtils).to receive(:cp).with("#{source_path}/#{files[0]}", "#{output_path}/#{files[0]}")

        subject.copy_static_files
      end
    end
  end

  describe "#copy_gemspec" do
    it "copies the file" do
      expect(FileUtils).to receive(:cp).with(
        "#{source_path}/semaphore_client._gemspec_",
        "#{output_path}/semaphore_client.gemspec"
      )

      subject.copy_gemspec
    end
  end

  describe "#generate_version" do
    let(:version) { "0.0.1" }
    let(:code_file) { double(SemaphoreClientGenerator::CodeFile, :generate => nil) }

    before do
      allow(File).to receive(:read).and_return(version)

      allow(SemaphoreClientGenerator::CodeFile).to receive(:new).and_return(code_file)
    end

    it "reads the version file" do
      expect(File).to receive(:read).with(version_path)

      subject.generate_version
    end

    context "version format is wrong" do
      let(:version) { "1" }

      it "raises an exception" do
        expect { subject.generate_version }.to raise_exception(SemaphoreClientGenerator::VersionFormatError)
      end
    end

    it "creates the code file" do
      expect(SemaphoreClientGenerator::CodeFile).to receive(:new).with(
        "#{source_path}/lib/semaphore_client/version.rb.erb",
        "#{output_path}/lib/semaphore_client"
      )

      subject.generate_version
    end

    it "generates the output file" do
      expect(code_file).to receive(:generate).with("version", :version => version)

      subject.generate_version
    end
  end

  describe "#generate_root" do
    let(:code_file) { double(SemaphoreClientGenerator::CodeFile, :generate => nil) }
    let(:entity) { double(:key => "user", :name => "User") }

    before do
      allow(subject).to receive(:entities).and_return([entity])

      allow(SemaphoreClientGenerator::CodeFile).to receive(:new).and_return(code_file)
    end

    it "creates the code file" do
      expect(SemaphoreClientGenerator::CodeFile).to receive(:new).with(
        "#{source_path}/lib/semaphore_client.rb.erb",
        "#{output_path}/lib"
      )

      subject.generate_root
    end

    it "generates the class file" do
      expect(code_file).to receive(:generate).with("semaphore_client", {
        :entities => [OpenStruct.new(:key => "user", :name => "User")]
      })

      subject.generate_root
    end
  end

  describe "#generate_model" do
    let(:code_file) { double(SemaphoreClientGenerator::CodeFile, :generate => nil) }
    let(:arguments) { {
      :name => "User",
      :attributes => [double, double],
      :mutable_attributes => [double],
      :immutable_attributes => [double]
    } }
    let(:entity) { double({ :key => "user" }.merge(arguments)) }

    before do
      allow(subject).to receive(:entities).and_return([entity])

      allow(SemaphoreClientGenerator::CodeFile).to receive(:new).and_return(code_file)
    end

    it "creates the code file" do
      expect(SemaphoreClientGenerator::CodeFile).to receive(:new).with(
        "#{source_path}/lib/semaphore_client/model/model.rb.erb",
        "#{output_path}/lib/semaphore_client/model"
      )

      subject.generate_model
    end

    it "generates the class files" do
      expect(code_file).to receive(:generate).with("user", arguments)

      subject.generate_model
    end
  end

  describe "#generate_api" do
    let(:code_file) { double(SemaphoreClientGenerator::CodeFile, :generate => nil) }
    let(:arguments) { { :key => "user", :name => "User", :methods => [double] } }
    let(:entity) { double(arguments) }

    before do
      allow(subject).to receive(:entities).and_return([entity])

      allow(SemaphoreClientGenerator::CodeFile).to receive(:new).and_return(code_file)
    end

    it "creates the code file" do
      expect(SemaphoreClientGenerator::CodeFile).to receive(:new).with(
        "#{source_path}/lib/semaphore_client/api/api.rb.erb",
        "#{output_path}/lib/semaphore_client/api"
      )

      subject.generate_api
    end

    it "generates the class files" do
      expect(code_file).to receive(:generate).with("user", arguments)

      subject.generate_api
    end
  end

  describe "#entities" do
    let(:entity) { double }
    let(:specification) { double(SemaphoreClientGenerator::Specification, :entities => [entity]) }

    before { allow(SemaphoreClientGenerator::Specification).to receive(:new).and_return(specification) }

    it "creates the specification" do
      expect(SemaphoreClientGenerator::Specification).to receive(:new).with(specification_path)

      subject.send(:entities)
    end

    it "returns the entities" do
      return_value = subject.send(:entities)

      expect(return_value).to eql([entity])
    end
  end

  it "has a version number" do
    expect(SemaphoreClientGenerator::VERSION).not_to be nil
  end
end
