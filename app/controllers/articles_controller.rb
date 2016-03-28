class ArticlesController < ApplicationController
	def new
	end

	def create
		@article = Article.new(article_params)
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
  end

private

#явно разрешаем использование параметров формы (сделано в целях защиты из вне)
def article_params
      params.require(:article).permit(:title, :text)
end

end
