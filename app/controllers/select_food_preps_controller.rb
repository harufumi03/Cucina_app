class SelectFoodPrepsController < ApplicationController
  def index
    @select_food_preps = SelectFoodPrep.all
    @group_select_food_preps = @select_food_preps.where(user_id: current_user.id)
  end

  def new
    @select_food_prep = SelectFoodPrep.new
  end

  def create
    @select_food_prep = SelectFoodPrep.new(select_food_prep_params)
    @select_food_prep.user_id = current_user.id
    @select_food_prep.food_prep_id = select_food_prep_params[:food_prep_id]
    if @select_food_prep.save
      redirect_to select_food_preps_path, notice: '仕込みを選択しました'
    else
      render :new
    end
  end

  def show
    @select_food_prep = SelectFoodPrep.find(params[:id])
    @comments = @select_food_prep.comments
    @comment = @select_food_prep.comments.build
  end

  def destroy
    @select_food_prep = SelectFoodPrep.find(params[:id])
    @select_food_prep.destroy
    redirect_to select_food_preps_path, notice: '仕込みを削除しました'
  end

  private

  def select_food_prep_params
    params.require(:select_food_prep).permit(:user_id, :food_prep_id, :to_do_at, :group_id)
  end
end
