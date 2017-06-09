class UsersController < ApplicationController


  def edit
    @user = User.find(current_user.id)
  end


  def update

    @user = User.find(current_user.id)
    @user.update_attributes(user_params)
    redirect_to controller: :messages, action: :index

  end


  def user_params
    params.require(:user).permit(:name, :email)
  end

end

