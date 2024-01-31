require "test_helper"

class ArticlesTest < ActionDispatch::IntegrationTest
  test 'get a list of Articles' do
    get api_v1_articles_path

    assert_response :success
    articles = JSON.parse(response.body)
    assert_equal articles.length, 2

    one_article = articles(:one)

    assert_equal one_article.title, articles.first.dig('title')
  end
end