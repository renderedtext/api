class SemaphoreClientGenerator
  module ResourceHolding
    def resources
      @resources ||= raw_resources.to_a.map do |resource|
        SemaphoreClientGenerator::Resource.new(resource)
      end
    end

    def resources_with_descendants
      @resources_with_descendants ||= resources.map(&:with_descendants).flatten
    end
  end
end
