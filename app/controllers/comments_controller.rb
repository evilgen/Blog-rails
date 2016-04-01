class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @article.commetns.create(comment_params)

    redirect_to article_path(@article)
  end

private

  def comment_params
      params.require(:comment).permit(:autor, :body)
  end

end
