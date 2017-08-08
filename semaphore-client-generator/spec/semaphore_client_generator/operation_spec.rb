require "spec_helper"

RSpec.describe SemaphoreClientGenerator::Operation do
  let(:parent_url) { "" }
  let(:relative_uri) { "" }
  let(:display_name) {}

  let(:raw_resource) { { "parentUrl" => parent_url, "relativeUri" => relative_uri } }
  let(:raw_method) { {} }

  subject { described_class.new(raw_resource, raw_method) }

  describe "#body" do
    let(:body) { { "key" => "value" } }

    before { raw_method["body"] = [body] }

    it "returns a list of attributes" do
      expect(subject.body).to eql(body)
    end
  end

  describe "#response" do
    context "response with the given code exists" do
      let(:body) { { "key" => "value" } }
      let(:response) { { "code" => 200, "body" => [body] } }

      before { raw_method["responses"] = [response] }

      it "returns the response with the given code" do
        return_value = subject.response(200)

        expect(return_value).to eql(body)
      end
    end

    context "response with the given code doesn't exist" do
      it "returns the response with the given code" do
        return_value = subject.response(200)

        expect(return_value).to be nil
      end
    end
  end

  describe "#type" do
    before { raw_method["method"] = method }

    context "operation is LIST_ALL" do
      let(:relative_uri) { "/entity" }
      let(:method) { "get" }

      it "returns LIST_ALL" do
        expect(subject.type).to eql(described_class::LIST_ALL)
      end
    end

    context "operation is GET" do
      let(:relative_uri) { "/entity/{entity_id}" }
      let(:method) { "get" }

      it "returns GET" do
        expect(subject.type).to eql(described_class::GET)
      end
    end

    context "operation is LIST_DEPENDENT" do
      let(:parent_url) { "/entity_1/{entity_1_id}" }
      let(:relative_uri) { "/entity_2" }
      let(:method) { "get" }

      it "returns LIST_DEPENDENT" do
        expect(subject.type).to eql(described_class::LIST_DEPENDENT)
      end
    end

    context "operation is CREATE_DEPENDENT" do
      let(:parent_url) { "/entity_1/{entity_1_id}" }
      let(:relative_uri) { "/entity_2" }
      let(:method) { "post" }

      it "returns CREATE_DEPENDENT" do
        expect(subject.type).to eql(described_class::CREATE_DEPENDENT)
      end
    end

    context "operation is ADD" do
      let(:parent_url) { "/entity_1/{entity_1_id}" }
      let(:relative_uri) { "/entity_2/{entity_2_id}" }
      let(:method) { "post" }
      let(:display_name) { "Add entity" }

      before { raw_method["displayName"] = display_name }

      it "returns ADD" do
        expect(subject.type).to eql(described_class::ADD)
      end
    end

    context "operation is ATTACH" do
      let(:parent_url) { "/entity_1/{entity_1_id}" }
      let(:relative_uri) { "/entity_2/{entity_2_id}" }
      let(:method) { "post" }

      before { raw_method["displayName"] = display_name }

      context "display name mentions attaching" do
        let(:display_name) { "Attach entity" }

        it "returns ATTACH" do
          expect(subject.type).to eql(described_class::ATTACH)
        end
      end

      context "display name mentions connecting" do
        let(:display_name) { "Connect entity" }

        it "returns ATTACH" do
          expect(subject.type).to eql(described_class::ATTACH)
        end
      end
    end

    context "operation is UPDATE" do
      let(:relative_uri) { "/entity/{entity_id}" }
      let(:method) { "patch" }

      it "returns UPDATE" do
        expect(subject.type).to eql(described_class::UPDATE)
      end
    end

    context "operation is DELETE" do
      let(:relative_uri) { "/entity/{entity_id}" }
      let(:method) { "delete" }

      it "returns DELETE" do
        expect(subject.type).to eql(described_class::DELETE)
      end
    end

    context "operation is REMOVE" do
      let(:parent_url) { "/entity_1/{entity_1_id}" }
      let(:relative_uri) { "/entity_2/{entity_2_id}" }
      let(:method) { "delete" }
      let(:display_name) { "Remove entity" }

      before { raw_method["displayName"] = display_name }

      it "returns REMOVE" do
        expect(subject.type).to eql(described_class::REMOVE)
      end
    end

    context "operation is DETACH" do
      let(:parent_url) { "/entity_1/{entity_1_id}" }
      let(:relative_uri) { "/entity_2/{entity_2_id}" }
      let(:method) { "delete" }

      before { raw_method["displayName"] = display_name }

      context "display name mentions detaching" do
        let(:display_name) { "Dettach entity" }

        it "returns DETACH" do
          expect(subject.type).to eql(described_class::DETACH)
        end
      end

      context "display name mentions disconnecting" do
        let(:display_name) { "Disconnect entity" }

        it "returns DETACH" do
          expect(subject.type).to eql(described_class::DETACH)
        end
      end
    end
  end

  describe "#related_entity" do
    context "it has a related entity" do
      let(:raw_method) { { "allUriParameters" => [{ "name" => "org_id" }] } }

      before { allow(subject).to receive(:type).and_return(described_class::ATTACH) }

      it "returns the related entity key" do
        expect(subject.related_entity).to eql("org")
      end
    end

    context "it doesn't have a related entity" do
      before { allow(subject).to receive(:type).and_return(described_class::UPDATE) }

      it "returns nil" do
        expect(subject.related_entity).to be nil
      end
    end
  end
end
