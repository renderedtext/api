# More info at https://github.com/guard/guard#readme

guard :process, :name => "compile", :command => "./scripts/compile" do
  watch(/entities/)
end

guard :process, :name => "server", :command => "./scripts/server" do
  watch(/static/)
end
