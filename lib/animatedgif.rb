require_relative "animatedgif/version"
require "httparty"

module Animatedgif
  include HTTParty
  base_uri "animatedgif.me"

  def self.find(id)
    get_url get("/gifs/#{id}.json")
  end

  def self.tagged(tag)
    get_url get("/#{tag}.json")
  end

  def self.random(tag)
    tagged(tag)
  end

  private
    def self.get_url(response)
      response.parsed_response["url"]
    end
end
