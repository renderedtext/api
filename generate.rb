#!/usr/bin/env ruby

require "github/markup"
require "html/pipeline"

puts "Generating schema"
system("bundle exec prmd combine schema/schemata/ > schema.json")

puts "Generating markdown documentation"
system("bundle exec prmd doc schema.json > schema.md")

puts "Generating index.html documentation"

def render_html(filename)
  markdown = File.read(filename)

  filters = [HTML::Pipeline::MarkdownFilter]

  pipeline = HTML::Pipeline.new(filters, :gfm => false)

  "<link rel='stylesheet' href='/stylesheets/style.css'/>" + pipeline.call(markdown)[:output]
end

File.write("public/index.html", render_html("schema.md"))
