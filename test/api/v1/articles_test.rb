require "test_helper"

class ArticlesTest < ActionDispatch::IntegrationTest
  test 'get a list of Articles' do
    get api_v1_articles_path

    assert_response :success

  end
end