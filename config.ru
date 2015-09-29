use Rack::Static,
  :urls => ["/stylesheets", "/images", "/javascripts"],
  :root => "public2"

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  [username, password] == [ENV["API_USERNAME"], ENV["API_PASSWORD"]]
end

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public2/index.html', File::RDONLY)
  ]
}
