require "github/markup"
require "html/pipeline"
require "erb"

namespace :api do
  namespace :html do

    task :render do
      Rake::Task["api:schema:combine"].execute
      Rake::Task["api:schema:doc"].execute

      File.write("public/index.html", render_html)
    end

    def render_html
      markdown = File.read("public/api.md")

      filters = [HTML::Pipeline::MarkdownFilter]

      pipeline = HTML::Pipeline.new(filters, :gfm => false)

      body = pipeline.call(markdown)[:output]

      ERB.new(File.read("views/index.erb")).result(binding)
    end

  end
end
