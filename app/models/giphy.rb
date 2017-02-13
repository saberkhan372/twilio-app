require 'httparty'

class Giphy
    BASE_URL = "https://api.giphy.com/v1/gifs"

  def self.search(query)
    response = HTTParty.get("#{BASE_URL}/search?q=#{query}&api_key=dc6zaTOxFJmzC")
    parsed_response = JSON.parse(response.body)

    parsed_response['data'].collect do |gifs|
        gifs['url']
    end

  end

  def self.mms_search(query)
    response = HTTParty.get("#{BASE_URL}/search?q=#{query}&api_key=dc6zaTOxFJmzC")
    parsed_response = JSON.parse(response.body)

    parsed_response['data'][0]['images']['fixed_height_downsampled']['url']
  end

  def self.trending()
    response = HTTParty.get("#{BASE_URL}/trending?api_key=dc6zaTOxFJmzC")
    parsed_response = JSON.parse(response.body)

    parsed_response['data'].map do |gifs|
      gifs['url']
    end

  end
end
