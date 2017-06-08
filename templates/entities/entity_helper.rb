require "json"

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
    generate_json_structure(body.first)
  end

  def body
    @raw["body"]
  end

  def empty?
    body.nil?
  end

  private

  def generate_json_structure(node)
    if node["type"] == "array"
      [ generate_json_structure(node["items"]) ]
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

class Route
  def initialize(resource, method)
    @resource = resource
    @method = method
  end

  def responses
    (@method.raw["responses"] || []).map { |response| Response.new(response) }
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
end

def routes
  @resources.map do |resource|
    resource.methods.map { |method| Route.new(resource, method) }
  end.flatten
end

# def body_entity_name(body)
#   name = body["displayName"]

#   name == body["key"] ? "-" : name
# end

# def resource_path(resource)
#   "#{resource.raw["parentUrl"]}#{resource.raw["relativeUri"]}"
# end

# def table_line(fields)
#   "| #{fields.join(" | ")} |"
# end

# def a_table(header, objects)
#   return unless objects.to_a.any?

#   header_line = table_line([header.keys])
#   break_line  = table_line(header.count.times.map { "---" })

#   body_lines = objects.map do |object|
#     fields = header.values.map { |key| table_field(object, key) }

#     table_line(fields)
#   end

#   lines = [header_line] + [break_line] + body_lines

#   lines.join("\n")
# end

# def table_field(object, key)
#   object = object.raw if object.respond_to?(:raw)

#   value = object[key]

#   if value.nil?
#     "-"
#   elsif value.kind_of?(Array)
#     "[#{value.join(", ")}]"
#   else
#     value
#   end
# end

# def uri_parameters_table(parameters)
#   header = { "Name" => "displayName", "Type" => "type", "Required?" => "required" }

#   a_table(header, parameters)
# end

# def properties_table(properties)
#   headers_list = {
#     "displayName" => "Name",
#     "type" => "Type",
#     "required" => "Required?",
#     "format" => "Format",
#     "enum" => "Enumeration"
#   }

#   keys = headers_list.keys & properties.map(&:raw).map(&:keys).flatten.uniq

#   header = keys.map { |key| [headers_list[key], key] }.to_h

#   a_table(header, properties)
# end

# def only_20x(responses)
#   responses.select { |response| /^20\d$/.match(response.raw["code"]) }
# end

# def full_http_code(response)
#   descriptions = { "200" => "OK", "204" => "No Content" }

#   "#{response} #{descriptions[response]}"
# end
