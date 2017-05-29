require "json"
require "nokogiri"

lines =  []

File.open("json-output.json", "r") do |file|
  file.each_line do |line|
    lines << line
  end
end

json = lines.join
content = JSON.parse(json)

html_builder = Nokogiri::HTML::Builder.new do |doc|
  doc.html do
    doc.body do
      content["resources"].map do |resource|
        doc.h1 do
          doc.text resource["displayName"]
        end
      end
    end
  end
end

html = html_builder.to_html

File.open("html-output.html", "w") do |file|
  file.write(html)
end
