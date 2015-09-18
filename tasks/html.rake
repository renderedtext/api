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

      filters = [
        HTML::Pipeline::MarkdownFilter,
        TableOfContentsFilter
      ]

      pipeline = HTML::Pipeline.new(filters, :gfm => false)

      body = pipeline.call(markdown)[:output]
      table_of_content = pipeline.call(markdown)[:toc]

      ERB.new(File.read("views/index.erb")).result(binding)
    end

    class TableOfContentsFilter < HTML::Pipeline::Filter
      PUNCTUATION_REGEXP = RUBY_VERSION > "1.9" ? /[^\p{Word}\- ]/u : /[^\w\- ]/

      def call
        result[:toc] = ""

        headers = Hash.new(0)

        doc.css('h2, h3').each do |node|
          text = node.text
          id = text.downcase
          id.gsub!(PUNCTUATION_REGEXP, '') # remove punctuation
          id.gsub!(' ', '-') # replace spaces with dash

          uniq = (headers[id] > 0) ? "-#{headers[id]}" : ''
          headers[id] += 1
          if header_content = node.children.first
            result[:toc] << %Q{<li class="nav-#{node.name}"><a href="##{id}#{uniq}">#{text}</a></li>\n}
            header_content.add_previous_sibling(%Q{<a id="#{id}#{uniq}" class="anchor" href="##{id}#{uniq}" aria-hidden="true"><span class="octicon octicon-link"></span></a>})
          end
        end

        result[:toc] = %Q{<ul class="section-nav">\n#{result[:toc]}</ul>} unless result[:toc].empty?
        doc
      end
    end

  end
end
