module Api
  module V1
    class ArticlesController < ApplicationController

      # GET /articles
      def index
        @articles = Article.all
        if @articles.empty?
          @articles = Article.seed_articles
        end
        render json: @articles
      end
    end
  end
end
