class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    @group.owner = current_user
    if @group.save
      @group.invite_member(@group.owner)
      redirect_to group_url(@group), notice: "チームを作成しました"
    else
      flash.now[:notice] = "チームの作成に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: "チームを編集しました"
    else
      flash.now[:error]
      render :edit
    end  
  end

  def destroy
    @group.destroy
    redirect_to "/", notice: "チームを削除しました"
  end
end

private

def set_group
  @group = Group.find(params[:id])
end

def group_params
  params.require(:group).permit(:name)
end

