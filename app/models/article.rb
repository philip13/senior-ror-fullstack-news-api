require 'uri'
require 'net/http'

class Article < ApplicationRecord

  def self.seed_articles
    res = Newsapi.new.get_top_headlines
    news_array = JSON.parse(res)["articles"]

    articles = news_array.map { |a|  {
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
