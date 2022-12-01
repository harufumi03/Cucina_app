class FoodPrepsController < ApplicationController
  before_action :set_food_prep, only: [ :show, :edit, :update, :destroy ]
  
  def index
    @food_preps = FoodPrep.all
  end

  def new
    @food_prep = FoodPrep.new
  end

  def create
    @food_prep = FoodPrep.new(food_prep_params)
    if @food_prep.save
      redirect_to food_preps_path, notice: '仕込みを登録しました'
    else
      render :new
    end
  end

  def show

  end
  
  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_food_prep
    @food_prep = FoodPrep.find(params[:id])
  end

  def food_prep_params
    params.require(:food_prep).permit(:name, :ingredient)
  end
end

end
