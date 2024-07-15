class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
      flash[:success] = '作成に成功しました'
    else
      render :new
      flash.now[:error] = '作成に失敗しました'
    end
  end

  def edit
    @article = article
  end

  def update
    if article.update(article_params)
      redirect_to articles_path
      flash[:success] = '更新に成功しました'
    else
      render :edit
      flash.now[:error] = '更新に失敗しました'
    end
  end

  def destroy
    if article.destroy
      redirect_to articles_path
      flash[:success] = '削除に成功しました'
    else
      render :index
      flash.now[:error] = '削除に失敗しました'
    end
  end

  private
    
    def article_params
      params[:article].permit(:title, :body)
    end

    def article
      @article ||= Article.find(params[:id])
    end
end
