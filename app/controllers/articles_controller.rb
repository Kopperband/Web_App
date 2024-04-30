class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article  = Article.new

  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path, notice: "Article Saved!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_path, notice: "Article Changed!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Article deleted successfully."
  end

private
  def article_params
    params.require(:article).permit(:title, :body)
  end


end
