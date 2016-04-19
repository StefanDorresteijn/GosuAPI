require 'date'
require 'rest-client'
require 'uri'

module GosuApi
  class Matchticker

    ##
    # Fetch a list of matches
    #
    # ==== Attributes
    #
    # * +game+ - The game you want to pull matches for
    # * +max_results+ - The max amount of results you want to pull
    # * +offset+ - The offset from where you want to start pulling data
    # * +date_from+ - From which date you'd like to start pulling data
    # * +date_to+ - Until which date you'd like to start pulling data
    #
    def get_matches(game = nil, max_results = 25, offset = 0, date_from = nil, date_to = nil)
      method = 'matches'
      parameters = {}

      raise ArgumentError.new("Max results is out of range. This parameter should not exceed 25 results.") if max_results < 1 || max_results > 25
      raise ArgumentError.new("Offset is out of range.") if offset < 0

      if game
        raise ArgumentError.new("This game is not a part of the Gosu Matchticker API.") unless GosuApi::GAMES.has_key?(game.to_sym)
        parameters['game'] = GosuApi::GAMES[game.to_sym]
      end

      if date_from
        raise ArgumentError.new("The date_from provided should be in the DD-MM-YYYY format.") unless date_from.is_a?(DateTime)
        parameters['dateFrom'] = date_from.strftime("%d-%m-%Y")
      end

      if date_to
        raise ArgumentError.new("The date_to provided should be in the DD-MM-YYYY format.") unless date_to.is_a?(DateTime)
        parameters['dateTo'] = date_to.strftime("%d-%m-%Y")
      end

      parameters['maxResults'] = max_results
      parameters['offset'] = offset

      api_result = send_request(method, parameters)
      api_result["matches"]
    end

    def send_request(method, parameters = {})
      parameters["apiKey"] = GosuApi.configuration.api_key
      result = RestClient.get "#{GosuApi::ENDPOINT}#{method}?#{URI.encode_www_form(parameters)}"
      case result.code
        when 200
          return JSON.parse result
        when 403
          raise GosuApi::Exception::ForbiddenError.new(result.to_str)
      end
    end

  end
end