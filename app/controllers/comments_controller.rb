class CommentsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @comment = @shop.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to shop_path(@shop), notice: '投稿できませんでした...' }
      end
    end
  end

  # def edit
  #   @comment = Comment.find(params[:id])
  # end

  # def update
  #   @comment = Comment.find(params[:id])
  #   @shop = @comment.shop
  #   redirect_to shop_path(@shop) if @comment.update(comment_params)
  # end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.js { render :index }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:shop_id,:content)
  end
end