class CommentsController < ApplicationController
  before_action :set_select_food_prep
  
  def edit
    @comment = @select_food_prep.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.html { redirect_to @select_food_prep }
      format.js { render :edit }
    end
  end

  def create
    @comment = @select_food_prep.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = 'コメントが投稿されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの投稿に失敗しました'
        format.js { render :index }
      end
    end
  end  

  def update
    @comment = @select_food_prep.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :index }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
      @comment.destroy!
      respond_to do |format|
        flash.now[:notice] = 'コメントが削除されました'
        format.js { render :index }
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :select_food_prep_id, :user_id)
  end

  def set_select_food_prep
    @select_food_prep = SelectFoodPrep.find(params[:select_food_prep_id])
  end
end
