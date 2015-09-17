require "prmd"
require "prmd/rake_tasks/combine"
require "prmd/rake_tasks/verify"
require "prmd/rake_tasks/doc"

namespace :api do
  namespace :schema do
    Prmd::RakeTasks::Combine.new do |t|
      # t.options[:meta] = 'schema/meta.json'
      t.paths << "schema/schemata/"
      t.output_file = "public/schema.json"
    end

    Prmd::RakeTasks::Verify.new do |t|
      t.files << "public/schema.json"
    end

    Prmd::RakeTasks::Doc.new do |t|
      t.files = { "public/schema.json" => "public/api.md" }
    end
  end
end
