class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new(article_param)
  end

  def create
    @article = Article.new(article_param)
    @article.save

    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_param
    params.require(:article).permit(:title, :content)
  end
end
