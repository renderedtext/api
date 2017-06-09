require "json"

### View helpers

def sorted_routes
  [
    routes.select(&:index?),
    routes.select(&:show?),
    routes.select(&:create?),
    routes.select(&:update?),
    routes.select(&:delete?),
    routes.select(&:connect?),
    routes.select(&:dissconnect?)
  ].flatten
end

def request_table(request)
  headers = [ "Name", "Type", "Required", "Example" ]

  data = request.fields.map do |f|
    [ f.name, f.type, f.required?.inspect, f.example ]
  end

  title     = "| #{headers.join(" | ")} |"
  seperator = "| #{headers.map { |h| '-' * h.size }.join(" | ")} |"
  rows      = data.map { |row| "| #{row.join(" | ")} |" }.join("\n")

"""
### Params

#{title}
#{seperator}
#{rows}
"""
end


### TODO: Move classes bellow to a gem

def routes
  @resources.map do |resource| resource.methods.map { |method| Route.new(resource, method) } end.flatten
end

module JsonExample
  module_function

  def generate(node)
    if node["type"] == "array"
      [ generate(node["items"]) ]
    elsif node["type"] == "object"
      node["properties"].map { |field| generate_json_field(field) }.to_h
    end
  end

  def generate_json_field(field)
    if field["type"] == "datetime"
      [field["key"], Time.at(Time.now - rand(5000))]
    else
      [field["key"], fetch_example(field)]
    end
  end

  def fetch_example(field)
    if field["example"]
      field["example"]
    elsif field["examples"] && field["examples"].first
      field["examples"].first["value"]
    end
  end
end

class Response
  def initialize(raw)
    @raw = raw
  end

  def code
    @raw["code"].to_i
  end

  def succesfull?
    code >= 200 && code < 300
  end

  def to_json
    JsonExample.generate(body.first)
  end

  def body
    @raw["body"]
  end

  def empty?
    body.nil?
  end

end

class Field
  def initialize(raw)
    @raw = raw
  end

  def name
    @raw["key"]
  end

  def type
    @raw["type"]
  end

  def required?
    @raw["required"] == "true"
  end

  def example
    if @raw["example"]
      @raw["example"]
    elsif @raw["examples"] && @raw["examples"].first
      @raw["examples"].first["value"]
    end
  end
end

class Request
  def initialize(raw)
    @raw = raw
  end

  def empty?
    @raw.nil?
  end

  def fields
    @raw.first["properties"].map { |field| Field.new(field) }
  end
end

class Route
  def initialize(resource, method)
    @resource = resource
    @method = method
  end

  def request
    Request.new(@method.raw["body"])
  end

  def responses
    (@method.raw["responses"] || []).map { |response| Response.new(response) }
  end

  def index?
    verb == "get" && for_collection?
  end

  def show?
    verb == "get" && for_member?
  end

  def create?
    verb == "post" && for_collection?
  end

  def update?
    verb == "patch" && for_member?
  end

  def delete?
    verb == "delete" && for_member?
  end

  def connect?
    verb == "post" && connection?
  end

  def dissconnect?
    verb == "delete" && connection?
  end

  def verb
    @method.raw["method"]
  end

  def path
    "#{@resource.raw["parentUrl"]}#{@resource.raw["relativeUri"]}"
  end

  def description
    @method.raw["description"]
  end

  def succesfull_response
    responses.find(&:succesfull?)
  end

  private

  def for_member?
    !connection? && @resource.raw["relativeUriPathSegments"].to_s.include?("{")
  end

  def for_collection?
    !connection? && !for_member?
  end

  def connection?
    if path.include?("shared_config")
      p verb, path
      p @method.raw["allUriParameters"]
    end

    @method.raw["allUriParameters"].size == 2
  end
end
