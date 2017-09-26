class SemaphoreClient
  class Exceptions
    class Base < StandardError; end

    class AttributeNotAvailable < Base; end

    class ResponseError < Base
      attr_reader :env

      def initialize(env)
        @env = env

        super(env[:message])
      end
    end

    # 400
    class BadRequest < ResponseError; end

    # 401
    class Unauthorized < Error; end

    # 404
    class NotFound < Error; end

    # 405
    class NotAllowed < Error; end

    # 409
    class Conflict < Error; end

    # 422
    class UnprocessableEntity < Error; end

    # 500+
    class ServerError < Error; end
  end
end
