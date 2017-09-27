class SemaphoreClient

  class HttpClient

    class ResponseErrorMiddleware < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status]
        when 401
          raise SemaphoreClient::Exceptions::Unauthorized, env
        when 404
          raise SemaphoreClient::Exceptions::NotFound, env
        when 405
          raise SemaphoreClient::Exceptions::NotAllowed, env
        when 409
          raise SemaphoreClient::Exceptions::Conflict, env
        when 422
          raise SemaphoreClient::Exceptions::UnprocessableEntity, env
        when 400...500
          raise SemaphoreClient::Exceptions::BadRequest, env
        when 500...600
          raise SemaphoreClient::Exceptions::ServerError, env
        end
      end
    end

    def initialize(auth_token, api_url, api_version, verbose, logger)
      @auth_token = auth_token
      @api_url = api_url
      @api_version = api_version
      @verbose = verbose
      @logger = logger
    end

    def get(path, params = nil)
      trace("GET", path) do
        connection.get(path, params)
      end
    end

    def post(path, params = nil)
      trace("POST", path, params) do
        connection.post(path, params)
      end
    end

    def patch(path, params = nil)
      trace("PATCH", path, params) do
        connection.patch(path, params)
      end
    end

    def delete(path, params = nil)
      trace("DELETE", path, params) do
        connection.delete(path, params)
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

        conn.use SemaphoreClient::HttpClient::ResponseErrorMiddleware
      end
    end
  end
end
