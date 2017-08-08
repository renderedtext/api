require "spec_helper"
require "semaphore_client_generator/resource_holding_spec"

RSpec.describe SemaphoreClientGenerator::Specification do
  let(:path) { "path" }

  subject { described_class.new(path) }

  it_behaves_like "resource_holding"

  describe "#content" do
    let(:raw_content) { "{\"a\":1}" }
    let(:content) { { :a => 1 } }

    before do
      allow(File).to receive(:read).and_return(raw_content)
      allow(JSON).to receive(:parse).and_return(content)
    end

    it "reads the file" do
      expect(File).to receive(:read).with(path)

      subject.content
    end

    it "parses the JSON" do
      expect(JSON).to receive(:parse).with(raw_content)

      subject.content
    end

    it "returns the content" do
      return_value = subject.content

      expect(return_value).to eql(content)
    end
  end

  describe "#raw_resources" do
    let(:raw_resource) { double }
    let(:content) { { "resources" => [raw_resource] } }

    before { allow(subject).to receive(:content).and_return(content) }

    it "gets the resources from the content" do
      expect(content).to receive(:[]).with("resources")

      subject.raw_resources
    end

    it "returns the raw_resources" do
      return_value = subject.raw_resources

      expect(return_value).to eql([raw_resource])
    end
  end

  describe "#entities" do
    let(:resource) { double(SemaphoreClientGenerator::Resource, :entity => "users") }
    let(:entity) { double(SemaphoreClientGenerator::Entity) }
    let(:property) { "property" }
    let(:type) { { "properties" => [{ "key" => property }] } }

    before do
      allow(subject).to receive(:resources_with_descendants).and_return([resource])
      allow(subject).to receive(:content).and_return({ "types" => { "User" => type } })

      allow(SemaphoreClientGenerator::Entity).to receive(:new).and_return(entity)
    end

    it "gets the resources" do
      expect(subject).to receive(:resources_with_descendants)

      subject.entities
    end

    it "creates the first group of entities" do
      expect(SemaphoreClientGenerator::Entity).to receive(:new).with("users", [property], [resource])

      subject.entities
    end

    it "returns the entities" do
      return_value = subject.entities

      expect(return_value).to eql([entity])
    end
  end

  context "fixture test" do
    let(:path) { "spec/fixtures/specification.json" }

    describe "#content" do
      it "returns the specification content" do
        return_value = subject.content

        expect(subject.content).to eql({ "a" => 1 })
      end
    end
  end
end
