require "rack/contrib/try_static"

use Rack::TryStatic,
  :root => "./",
  :urls => %w[/],
  :try => ['.html', 'index.html', '/index.html']

  run -> { [404, {'Content-Type' => 'text/html'}, ['Not Found']]}
