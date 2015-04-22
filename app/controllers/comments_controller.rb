class CommentsController < ApplicationController
  before_action :load_article
  def create
    @comment = @article.comments.new(comment_params)
    if comment.save
      redirect_to @article, notice:'Thanks you for comment'
    else
      redirect_to @artical,alert: 'Unable to add comment'
    end
  end
  def destroy
    @comment = @artical.comment.find(params[:id])
    comment.destroy
    redirect_to @article, notice: 'Comment Deleted'
  end

  private
  def load_article
  @article = Article.find(params[:article_id])
  end
  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
