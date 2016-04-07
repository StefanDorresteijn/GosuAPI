module GosuApi
  module Exceptions
    class ForbiddenError < StandardError
      def initialize(msg = "You are not allowed to request this content")
        super(msg)
      end
    end
  end
end