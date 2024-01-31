require 'uri'
require 'net/http'

class Newsapi
  def initialize
    @api_key = ENV['API_KEY']
    @news_uri = ENV['NEWS_URI']
  end

  def get_top_headlines
    uri = URI("#{@news_uri}/top-headlines?country=us&apiKey=#{@api_key}")
    res = Net::HTTP.get_response(uri)

    return res.is_a?(Net::HTTPSuccess) ? res.body : []
  end
end
