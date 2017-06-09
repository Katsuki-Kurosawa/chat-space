class UsersController < ApplicationController


  def edit
    @user = User.find(current_user)
  end


  def update

    @user = User.find(current_user)

    if current_user.id == @user.id
      @user.update_attributes(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end

