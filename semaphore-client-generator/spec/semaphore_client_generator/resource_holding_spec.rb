RSpec.shared_examples "resource_holding" do |subject_class|
  describe "#resources" do
    let(:raw_resource) { double }
    let(:resource) { double(SemaphoreClientGenerator::Resource) }

    before do
      resources = [resource]
      resources << subject if subject_class == SemaphoreClientGenerator::Resource

      allow(SemaphoreClientGenerator::Resource).to receive(:new).and_return(*resources)

      allow(subject).to receive(:raw_resources).and_return([raw_resource])
    end

    it "accesses the raw resources" do
      expect(subject).to receive(:raw_resources)

      subject.resources
    end

    it "creates the resources" do
      expect(SemaphoreClientGenerator::Resource).to receive(:new).with(raw_resource)

      subject.resources
    end

    it "returns the resources" do
      return_value = subject.resources

      expect(return_value).to eql([resource])
    end
  end

  describe "#resources_with_descendants" do
    let(:resource_1) { double(SemaphoreClientGenerator::Resource) }
    let(:resource_2) { double(SemaphoreClientGenerator::Resource) }

    before do
      allow(resource_1).to receive(:with_descendants).and_return([resource_1])
      allow(resource_2).to receive(:with_descendants).and_return([resource_2, resource_1])

      allow(subject).to receive(:resources).and_return([resource_2])
    end

    it "returns the resources with descendants" do
      return_value = subject.resources_with_descendants

      expect(return_value).to eql([resource_2, resource_1])
    end
  end

  describe "#raw_resources" do
    it "implements the raw_resources method" do
      expect(subject).to respond_to(:raw_resources)
    end
  end
end
