require "spec_helper"
require "semaphore_client_generator/shared_examples_for_resource_holding"

RSpec.describe SemaphoreClientGenerator::Resource do
  let(:raw_resource) { {} }

  subject { described_class.new(raw_resource) }

  it_behaves_like "resource_holding", described_class

  describe "#operations" do
    let(:raw_method) { double }
    let(:raw_resource) { { "methods" => [raw_method] } }
    let(:operation) { double(SemaphoreClientGenerator::Operation) }

    before { allow(SemaphoreClientGenerator::Operation).to receive(:new).and_return(operation) }

    it "creates the operations" do
      expect(SemaphoreClientGenerator::Operation).to receive(:new).with(raw_resource, raw_method)

      subject.operations
    end

    it "returns the operations" do
      expect(subject.operations).to eql([operation])
    end
  end

  describe "#operations?" do
    context "there are operations" do
      before { allow(subject).to receive(:operations).and_return([double]) }

      it "returns true" do
        expect(subject.operations?).to be true
      end
    end

    context "there are no operations" do
      before { allow(subject).to receive(:operations).and_return([]) }

      it "returns false" do
        expect(subject.operations?).to be false
      end
    end
  end

  describe "#raw" do
    it "returns the raw resource" do
      expect(subject.raw).to eql(raw_resource)
    end
  end

  describe "#raw_resources" do
    let(:raw_child_resource) { double }
    let(:raw_resource) { { "resources" => [raw_child_resource] } }

    it "has raw_resources" do
      expect(subject.raw_resources).to eql([raw_child_resource])
    end
  end

  describe "#entity" do
    context "it is a collection endpoint" do
      before { raw_resource["absoluteUri"] = "/something/something/users" }

      it "returns 'user'" do
        expect(subject.entity).to eql("user")
      end
    end

    context "it is an individual endpoint" do
      before { raw_resource["absoluteUri"] = "/something/{something_id}/users/{user_id}" }

      it "returns 'user'" do
        expect(subject.entity).to eql("user")
      end
    end
  end

  describe "#with_descendants" do
    let(:child_resource) { double(SemaphoreClientGenerator::Resource) }

    before { allow(subject).to receive(:resources_with_descendants).and_return([child_resource]) }

    it "returns the subject with the descendants" do
      expect(subject.with_descendants).to eql([subject, child_resource])
    end
  end
end
