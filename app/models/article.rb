require 'uri'
require 'net/http'

class Article < ApplicationRecord

  def self.feed_articles
    api_key = ENV['API_KEY']
    uri = URI("https://newsapi.org/v2/top-headlines?country=us&apiKey=#{ENV['API_KEY']}")
    res = Net::HTTP.get_response(uri)
    articles = res.is_a?(Net::HTTPSuccess) ? res.body : []
    news_array = JSON.parse(articles)["articles"]
    serialize(news_array)
  end


  private
  def self.serialize articles
    articles = articles.map { |a|  {
        author: a["author"],
        title: a["title"] ,
        description: a["description"],
        url: a["url"],
        url_to_image: a["urlToImage"],
        published_at: a["publishedAt"],
        content: a["content"]
      }
    }
    Article.create!(articles)
  end
end
