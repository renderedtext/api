class SemaphoreClientGenerator
  class Entity
    attr_reader :key, :attributes, :resources

    def initialize(key, attributes, resources)
      @key = key
      @attributes = attributes
      @resources = resources.select(&:operations?)
    end

    def operations
      @operations ||= @resources.map(&:operations).flatten
    end

    def name
      @key.camelize
    end

    def mutable_attributes
      @mutable_attributes ||= begin
        operation = find_operation(Operation::UPDATE)

        operation ? attribute_keys(operation.body) : []
      end
    end

    def immutable_attributes
      attributes - mutable_attributes
    end

    def methods
      operations.map do |operation|
        OpenStruct.new(
          :type => operation.type,
          :related_entity => operation.related_entity
        )
      end
    end

    private

    def attribute_keys(message)
      message.to_h["properties"].to_a.map { |property| property["key"] }
    end

    def find_operation(type)
      operations.find { |operation| operation.type == type }
    end
  end
end
