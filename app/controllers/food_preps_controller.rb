class FoodPrepsController < ApplicationController
  before_action :set_food_prep, only: [ :show, :edit, :update, :destroy ]
  before_action :set_search_food_prep, only: [:index, :search]
  
  def index
    @food_preps = FoodPrep.all 
    @group_food_preps = @food_preps.where(group_id: current_user.group_ids)
  end

  def new
    @food_prep = FoodPrep.new
    @groups = GroupUser.where(user_id: current_user.id)
  end

  def create
    @food_prep = FoodPrep.new(food_prep_params)
    if @food_prep.save
      redirect_to food_preps_path, notice: '仕込みを登録しました'
    else
      @groups = GroupUser.where(user_id: current_user.id)
      render :new, notice: '仕込みの作成に失敗しました'
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @food_prep.update(food_prep_params)
      redirect_to food_preps_path, notice: '仕込みを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @food_prep.destroy
    redirect_to food_preps_path, notice: '仕込みを削除しました'
  end

  def search
    @results = @search_food_prep.result
  end

  private

  def set_food_prep
    @food_prep = FoodPrep.find(params[:id])
  end

  def food_prep_params
    params.require(:food_prep).permit(:name, :ingredient, { label_ids: [] }, :group_id)
  end

  def set_search_food_prep
    @search_food_prep = FoodPrep.ransack(params[:q])
  end
end