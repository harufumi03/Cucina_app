class GroupUsersController < ApplicationController
  
  def create
    group = find_group(params[:group_id])
    user = email_reliable?(group_user_params)? User.find_by(email: group_user_params) : nil
    if user
      group.invite_member(user)
      redirect_to group_url(group), notice: '招待に成功しました'
    else
      redirect_to group_url(group), notice: '招待に失敗しました'
    end
  end

  def destroy
    group_user = find_user(params[:id])
    group_user.destroy
    redirect_to "/", notice: "グループから退出しました"
  end

  private

  def group_user_params
    params[:post][:email]
  end

  def email_reliable?(email)
    email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def find_group(group_id)
    Group.find(params[:group_id])
  end

  def find_user(*)
    GroupUser.find_by(group_id: params[:id], user_id: current_user)
  end
end
