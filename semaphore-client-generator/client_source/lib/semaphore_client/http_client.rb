class SemaphoreClient

  class HttpClient

    class ResponseErrorMiddleware < Faraday::Middleware
      def call(env)
        @app.call(env).on_complete do |env|
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
    end

    def initialize(auth_token, api_url, api_version, verbose, logger)
      @auth_token = auth_token
      @api_url = api_url
      @api_version = api_version
      @verbose = verbose
      @logger = logger
    end

    def get(path, params = nil)
      api_call(:get, path, params)
    end

    def post(path, params = nil)
      api_call(:post, path, params)
    end

    def patch(path, params = nil)
      api_call(:patch, path, params)
    end

    def delete(path, params = nil)
      api_call(:delete, path, params)
    end

    private

    def api_call(method, path, params = nil)
      route = "/#{@api_version}/#{path}"

      connection.public_send(method, route, params)
    end

    def connection
      @connection ||= Faraday.new(:url => @api_url, :headers => headers) do |conn|
        conn.request :json
        conn.response :json

        if @verbose
          conn.response :logger, @logger, :headers => false, :bodies => true
        end

        conn.use SemaphoreClient::HttpClient::ResponseErrorMiddleware

        conn.adapter Faraday.default_adapter
      end
    end

    def headers
      { "Authorization" => "Token #{@auth_token}" }
    end
  end
end
