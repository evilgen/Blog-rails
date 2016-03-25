class ArticlesController < ApplicationController
	def new
	end

	def create
		@article = Article.new(article_params)
    @article.save
	end

private

#явно разрешаем использование параметров формы (сделано в целях защиты из вне)
def article_params
      params.require(:article).permit(:title, :text)
end

end
