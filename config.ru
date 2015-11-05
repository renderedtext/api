use Rack::Static,
  :urls => ["/stylesheets", "/images", "/javascripts"],
  :root => "static"

unless ENV["UNSECURE"]
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == [ENV["API_USERNAME"], ENV["API_PASSWORD"]]
  end
end

run lambda { |env|
  [
    200,
    {
      "Content-Type"  => "text/html",
      "Cache-Control" => "public, max-age=86400"
    },
    File.open("static/index.html", File::RDONLY)
  ]
}
