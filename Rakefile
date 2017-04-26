require "rubygems"
require "bundler/setup"
require "github/markup"
require "html/pipeline"
require "erb"

task :render_html do
  File.write("index.html", render_html)
end

def render_html
  markdown = File.read("schema.md")

  filters = [ HTML::Pipeline::MarkdownFilter ]

  pipeline = HTML::Pipeline.new(filters, :gfm => false)

  body = pipeline.call(markdown)[:output]
  table_of_content = pipeline.call(markdown)[:toc]

  ERB.new(File.read("views/index.erb")).result(binding)
end
