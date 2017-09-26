class SemaphoreClient
  class HttpClient
    class RouteNotSupported < StandardError; end

    def initialize(auth_token, api_url, api_version, verbose, logger)
      @auth_token = auth_token
      @api_url = api_url
      @api_version = api_version
      @verbose = verbose
      @logger = logger
    end

    def get(path, params = nil)
      trace("GET", route) do
        connection.get(route, params)
      end
    end

    def post(path, params = nil)
      trace("POST", route, params) do
        connection.post(route, params)
      end
    end

    def patch(path, params = nil)
      trace("PATCH", route, params) do
        connection.patch(route, params)
      end
    end

    def delete(path, params = nil)
      trace("DELETE", route, params) do
        connection.delete(route, params)
      end
    end

    private

    def trace(method, path, params = nil)
      if @verbose == true
        id = SecureRandom.hex
        started_at = Time.now.to_f

        @logger.info "#{id} #{method} #{path} body: #{params.inspect}"
        response = yield

        finished_at = Time.now.to_f
        @logger.info "#{id} #{response.status} duration: #{finished_at - started_at}s body: #{response.body}"

        response
      else
        yield
      end
    end

    def connection
      @connection ||= Faraday.new(:url => @api_url, :headers => { "Authorization" => "Token #{@auth_token}" }) do |conn|
        conn.request :json
        conn.response :json
      end
    end
  end
end
