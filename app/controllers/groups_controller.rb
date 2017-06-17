class GroupsController < ApplicationController

  before_action :group_set, except: [:new, :create]

  def  new   #グループ、メンバーの作成
    @group = Group.new
  end

  def create   #グループ、メンバーの保存
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash[:alert] = "グループ名を入力してください"
      render :new
    end
  end

  def edit   #グループ、メンバーの修正
  end

  def update   #グループ、メンバーの修正の更新
    if @group.update(group_params)
      redirect_to root_path, notice: "グループ名の編集が完了しました"
    else
     flash[:alert] = "グループ名を入力してください"
     render :edit
   end
 end

 private
 def group_params
   params.require(:group).permit(:name, :user_ids =>[])
 end

 def group_set
   @group = Group.find(params[:id])
 end
end
