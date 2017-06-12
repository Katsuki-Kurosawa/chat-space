class UsersController < ApplicationController
 before_action :user_set

 def edit
 end

 def update
   if current_user.id == @user.id
    @user.update_attributes(user_params)
    redirect_to root_path
  else
    render :user_set
  end
end

private
def user_params
  params.require(:user).permit(:name, :email)
end

def user_set
  @user = User.find(current_user)
end

end
