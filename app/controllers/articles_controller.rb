class ArticlesController < ApplicationController
	def show
		@article = Article.find(params[:id])
		@title = @article.title
	end

	def index 
		@title = "Weight Loss Articles"
		@articles = Article.all
	end
end
