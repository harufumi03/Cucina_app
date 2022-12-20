class UsersController < ApplicationController
  def show
    @user = current_user
    @groups = Group.all
  end
end
