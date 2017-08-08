class SemaphoreClientGenerator
  class Resource
    include ResourceHolding

    attr_reader :raw

    def initialize(raw)
      @raw = raw
    end

    def operations?
      operations.any?
    end

    def operations
      @operations ||= @raw["methods"].to_a.map do |method|
        Operation.new(@raw, method)
      end
    end

    def entity
      tokens = @raw["absoluteUri"].split("/").map do |token|
        token.gsub(/{.*}/, "")
      end

      tokens.reject(&:empty?).last.to_s.singularize
    end

    def with_descendants
      [self] + resources_with_descendants
    end

    def raw_resources
      @raw["resources"]
    end
  end
end
