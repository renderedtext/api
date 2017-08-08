require "spec_helper"

RSpec.describe SemaphoreClientGenerator::Entity do
  let(:key) { "entity" }
  let(:attribute) { "attribute" }
  let(:resources) { [] }

  subject { described_class.new(key, [attribute], resources) }

  describe "#operations" do
    let(:operation_1) { double(SemaphoreClientGenerator::Operation) }
    let(:operation_2) { double(SemaphoreClientGenerator::Operation) }

    let(:resource_1) { double(SemaphoreClientGenerator::Resource, :operations? => true, :operations => [operation_1]) }
    let(:resource_2) { double(SemaphoreClientGenerator::Resource, :operations? => true, :operations => [operation_2]) }
    let(:resource_3) { double(SemaphoreClientGenerator::Resource, :operations? => false) }

    let(:resources) { [resource_1, resource_2, resource_3] }

    it "returns a flat list of resources' operations" do
      expect(subject.operations).to eql([operation_1, operation_2])
    end
  end

  describe "#methods" do
    let(:operation) { double(SemaphoreClientGenerator::Operation, :type => "a", :related_entity => "b") }
    let(:struct) { double(OpenStruct) }

    before do
      allow(subject).to receive(:operations).and_return([operation])
      allow(OpenStruct).to receive(:new).and_return(struct)
    end

    it "creates structs for methods" do
      expect(OpenStruct).to receive(:new).with(:type => "a", :related_entity => "b")

      subject.methods
    end

    it "returns the structs" do
      expect(subject.methods).to eql([struct])
    end
  end

  describe "#name" do
    it "returns the name" do
      expect(subject.name).to eql("Entity")
    end
  end

  describe "#mutable_attributes" do
    context "mutable attributes can be found" do
      let(:attribute) { { "key" => "attribute_key" } }
      let(:body) { { "properties" => [attribute] } }
      let(:operation) { double(SemaphoreClientGenerator::Operation,
                               :type => SemaphoreClientGenerator::Operation::UPDATE,
                               :body => body) }

      before { allow(subject).to receive(:operations).and_return([operation]) }

      it "returns the mutable attribute keys" do
        expect(subject.mutable_attributes).to eql(["attribute_key"])
      end
    end

    context "mutable attributes can't be found" do
      before { allow(subject).to receive(:operations).and_return([]) }

      it "returns an empty array" do
        expect(subject.mutable_attributes).to eql([])
      end
    end
  end

  describe "#immutable_attributes" do
    let(:mutable_attribute) { "key_1" }
    let(:immutable_attribute) { "key_2" }

    before do
      allow(subject).to receive(:attributes).and_return([mutable_attribute, immutable_attribute])
      allow(subject).to receive(:mutable_attributes).and_return([mutable_attribute])
    end

    it "returns the immutable attribute keys" do
      expect(subject.immutable_attributes).to eql(["key_2"])
    end
  end

  describe "#find_operation" do
    context "operation exists" do
      let(:operation_1) { double(SemaphoreClientGenerator::Operation, :type => SemaphoreClientGenerator::Operation::GET) }
      let(:operation_2) { double(SemaphoreClientGenerator::Operation, :type => SemaphoreClientGenerator::Operation::UPDATE) }

      before { allow(subject).to receive(:operations).and_return([operation_1, operation_2]) }

      it "returns the operation" do
        return_value = subject.send(:find_operation, SemaphoreClientGenerator::Operation::GET)

        expect(return_value).to eql(operation_1)
      end
    end

    context "operation doesn't exist" do
      it "returns nil" do
        return_value = subject.send(:find_operation, SemaphoreClientGenerator::Operation::GET)

        expect(return_value).to be nil
      end
    end
  end
end
