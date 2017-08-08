class SemaphoreClientGenerator
  class Specification
    include ResourceHolding

    def initialize(path)
      @path = path
    end

    def content
      @content ||= begin
        raw_content = File.read(@path)

        JSON.parse(raw_content)
      end
    end

    def entities
      @entities ||= begin
        entity_groups = resources_with_descendants.group_by(&:entity)

        entity_groups.map do |entity, resources|
          type = entity.singularize.camelize

          properties = content["types"][type]["properties"].map do |property|
            property["key"]
          end

          Entity.new(entity, properties, resources)
        end
      end
    end

    def raw_resources
      content["resources"]
    end
  end
end
