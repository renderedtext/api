# More info at https://github.com/guard/guard#readme

interactor :off # we don't need console access to guard

guard :process, :name => "compile", :command => "./scripts/compile" do
  watch(/schemata/)
end

guard :process, :name => "server", :command => "./scripts/server" do
  watch(/view/)
end
