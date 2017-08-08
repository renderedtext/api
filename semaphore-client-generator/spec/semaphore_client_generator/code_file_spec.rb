require "spec_helper"
require "fileutils"

RSpec.describe SemaphoreClientGenerator::CodeFile do
  let(:template_path) { "template_path" }
  let(:output_root_path) { "output" }

  subject { described_class.new(template_path, output_root_path) }

  describe "#content" do
    let(:args) { { :a => 1 } }
    let(:content) { "123\n" }
    let(:template) { double(ERB, :result => content) }
    let(:context) { double(Object) }

    before do
      allow(subject).to receive(:template).and_return(template)
      allow(subject).to receive(:context).and_return(context)
    end

    it "accesses the template" do
      expect(subject).to receive(:template)

      subject.content(args)
    end

    it "accesses the context" do
      expect(subject).to receive(:context)

      subject.content(args)
    end

    it "generates the result" do
      expect(template).to receive(:result).with(context)

      subject.content(args)
    end

    it "returns the content" do
      return_value = subject.content(args)

      expect(return_value).to eql(content)
    end
  end

  describe "#generate" do
    let(:output_relative_path) { "output/relative/path" }
    let(:args) { { :a => 1 } }
    let(:content) { "123\n" }

    before do
      allow(FileUtils).to receive(:mkdir_p)
      allow(File).to receive(:write)
      allow(subject).to receive(:content).and_return(content)
    end

    it "attempts to create the output directory" do
      dir_path = [output_root_path, output_relative_path].join("/").split("/").tap(&:pop).join("/")

      expect(FileUtils).to receive(:mkdir_p).with(dir_path)

      subject.generate(output_relative_path, args)
    end

    it "accesses the content" do
      expect(subject).to receive(:content)

      subject.generate(output_relative_path, args)
    end

    it "writes the file" do
      output_path = "#{output_root_path}/#{output_relative_path}.rb"

      expect(File).to receive(:write).with(output_path, content)

      subject.generate(output_relative_path, args)
    end
  end

  describe "#context" do
    let(:args) { { :a => 1 } }
    let(:binding) { double(Binding) }
    let(:struct) { double(OpenStruct,
                          :instance_variable_set => nil,
                          :binding => binding) }

    before do
      allow(OpenStruct).to receive(:new).and_return(struct)
      allow(struct).to receive(:each_pair).and_yield(:a, 1)
    end

    it "creates the struct" do
      expect(OpenStruct).to receive(:new).with(args)

      subject.send(:context, args)
    end

    it "calls instance_eval" do
      expect(struct).to receive(:instance_eval)

      subject.send(:context, args)
    end

    it "iterates through the pairs" do
      expect(struct).to receive(:each_pair)

      subject.send(:context, args)
    end

    it "sets the instance variables" do
      expect(struct).to receive(:instance_variable_set).with(:@a, 1)

      subject.send(:context, args)
    end

    it "creates the binding" do
      expect(struct).to receive(:binding)

      subject.send(:context, args)
    end

    it "returns the binding" do
      return_value = subject.send(:context, args)

      expect(return_value).to eql(binding)
    end
  end

  describe "#template" do
    let(:file) { double(File) }
    let(:template) { double(ERB) }

    before do
      allow(File).to receive(:read).and_return(file)
      allow(ERB).to receive(:new).and_return(template)
    end

    it "reads the file" do
      expect(File).to receive(:read).with(template_path)

      subject.send(:template)
    end

    it "creates the template" do
      expect(ERB).to receive(:new).with(file, nil, "-")

      subject.send(:template)
    end

    it "returns the template" do
      return_value = subject.send(:template)

      expect(return_value).to eql(template)
    end
  end

  context "fixture test" do
    let(:template_path) { "spec/fixtures/code_file_template.rb.erb" }
    let(:args) { { :key => "123" } }

    describe "#content" do
      it "returns the rendered content" do
        return_value = subject.content(args)

        expect(return_value).to eql("123\n")
      end
    end

    describe "#generate" do
      let(:output_root_path) { "/tmp" }
      let(:output_relative_path) { rand.to_s }
      let(:output_path) { "#{output_root_path}/#{output_relative_path}.rb" }

      it "generates the code file" do
        subject.generate(output_relative_path, args)

        saved_content = File.read(output_path)

        expect(saved_content).to eql("123\n")
      end

      after { FileUtils.rm_rf(output_path) }
    end
  end
end
