class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    @article = Article.first
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end


  def destroy
    if @article.destroy
      head :no_content
    else
      render JSON: @article.errors, status: :unprocessable_entity
    end
  end
  
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
