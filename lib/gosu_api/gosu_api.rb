require 'json'
require 'net/http'

module GosuApi

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(self.configuration)
  end

  ENDPOINT = 'http://www.gosugamers.net/api/'
  GAMES = {
      :counterstrike => 'counterstrike',
      :dota2 => 'dota2',
      :hearthstone => 'hearthstone',
      :heroesofthestorm => 'heroesofthestorm',
      :lol => 'lol',
      :overwatch => 'overwatch',
      :sc2 => 'starcraft2'
  }
end