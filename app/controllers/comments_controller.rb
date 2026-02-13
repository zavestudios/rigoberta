class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to @article, notice: "Comment was successfully created." }
      else
        format.turbo_stream { render :create, status: :unprocessable_content }
        format.html { redirect_to @article, alert: "Comment could not be created." }
      end
    end
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
