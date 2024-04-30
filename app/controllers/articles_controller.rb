class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @articles = Article.find(params[:id])
  end

  def new
    @articles  = Article.new

  end

  def create
    @articles = Article.new(article_params)

    if @articles.save
      redirect_to articles_path, notice: "Article Saved!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def update
    @articles = Article.find(params[:id])

    if @articles.update(article_params)
      redirect_to articles_path, notice: "Article Changed!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @articles = Article.find(params[:id])
    @articles.destroy

    redirect_to articles_path, notice: "Article Deleted"
  end

private
  def article_params
    params.require(:article).permit(:title, :body)
  end


end
