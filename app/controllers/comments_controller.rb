class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]

  def create
    @article = Article.find(params[:article_id])
    # @article.comments.create(comment_params)
    com = @article.comments.new do |c|
      c.autor = current_user.username
      c.body = comment_params[:body]
    end
    com.save

    redirect_to article_path(@article)
  end

private

  def comment_params
    params.require(:comment).permit(:body)
    # params.require(:comment).permit(:autor, :body)
  end

end
