module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :set_article, only: %i[ show update destroy ]

      # GET /articles
      def index
        @articles = Article.all
        if @articles.empty?
          @articles = Article.feed_articles
        end
        render json: @articles
      end
    end
  end
end
