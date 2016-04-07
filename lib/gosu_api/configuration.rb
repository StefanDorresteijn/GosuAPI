module GosuApi
  class Configuration
    attr_accessor :api_key

    def initialize
      @api_key = "example key"
    end
  end
end