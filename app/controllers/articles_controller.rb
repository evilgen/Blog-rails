class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]


  def new
  end

  def create
    strong_params = article_params
    strong_params["username"] = current_user.username
    @article = Article.new(strong_params)
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to @article, notice: 'Something was successfully destroyed.'
  end

private

#явно разрешаем использование параметров формы (сделано в целях защиты из вне)
def article_params
  params.require(:article).permit(:title, :text, :username)
end

end
