class UsersController < ApplicationController


  def edit
    @user = User.find(current_user.id)
  end


  def update

    @user = User.find(current_user.id)

    if current_user.id == @user.id
      @user.update_attributes(user_params)
      redirect_to root_path
    else
      redirect_to edit_user_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end

