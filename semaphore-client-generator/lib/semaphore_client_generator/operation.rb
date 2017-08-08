class SemaphoreClientGenerator
  class Operation
    class OperationMissing < StandardError; end

    LIST_ALL = :list_all
    GET = :get
    LIST_DEPENDENT = :list_dependent
    CREATE_DEPENDENT = :create_dependent
    ADD = :add
    ATTACH = :attach
    UPDATE = :update
    DELETE = :delete
    REMOVE = :remove
    DETACH = :detach

    RELATIONAL_OPERATIONS = [
      LIST_DEPENDENT, CREATE_DEPENDENT, ADD, ATTACH, REMOVE, DETACH
    ]

    attr_reader :raw

    def initialize(raw_resource, raw_method)
      @raw = raw_method
      @uri = raw_resource["parentUrl"].to_s + raw_resource["relativeUri"].to_s
      @display_name = raw_method["displayName"].to_s.downcase
    end

    def type
      @type ||= case [uri_length, @raw["method"]]
        when [1, "get"]    then LIST_ALL
        when [2, "get"]    then GET
        when [3, "get"]    then LIST_DEPENDENT
        when [3, "post"]   then CREATE_DEPENDENT
        when [4, "post"]   then add_or_attach
        when [2, "patch"]  then UPDATE
        when [2, "delete"] then DELETE
        when [4, "delete"] then remove_or_detach
        else raise OperationMissing
      end
    end

    def related_entity
      return unless RELATIONAL_OPERATIONS.include?(type)

      @raw["allUriParameters"].to_a.first.to_h["name"].split("_").tap(&:pop).join("_")
    end

    def body
      @raw["body"].to_a.first
    end

    def response(code)
      response = @raw["responses"].to_a.find { |response| response["code"] == code }

      response.to_h["body"].to_a.first
    end

    private

    def add_or_attach
      if @display_name.include?("add")
        ADD
      elsif @display_name.include?("attach") || @display_name.include?("connect")
        ATTACH
      else raise OperationMissing
      end
    end

    def remove_or_detach
      if @display_name.include?("remove")
        REMOVE
      elsif @display_name.include?("dettach") || @display_name.include?("disconnect")
        DETACH
      else raise OperationMissing
      end
    end

    def uri_length
      @uri.split("/").compact.reject(&:empty?).count
    end
  end
end
