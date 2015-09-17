#!/usr/bin/env ruby

require "github/markup"

puts "Generating schema"
system("bundle exec prmd combine schema/schemata/ > schema.json")

puts "Generating markdown documentation"
system("bundle exec prmd doc schema.json > schema.md")

puts "Generating index.html documentation"
markdown = File.read("schema.md")
html = GitHub::Markup.render("schema.md", markdown)

File.write("index.html", html)
