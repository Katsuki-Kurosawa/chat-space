class MessagesController < ApplicationController

  before_action :groups_set, only: [:index, :create]
  before_action :set_new_message, only: [:create]

  def index    #ホーム画面
   @message = Message.new
 end

  def create   #メッセージ送信、保存
   if @message.save
    redirect_to group_messages_path, notice: "メッセージを送信しました"
  else
    flash.now[:alert] = "メッセージを入力してください"
    render :index
  end
end

private

def message_params
  params.require(:message).permit(:body, :image).merge(user_id: current_user.id,
    group_id: params[:group_id])
end

def set_new_message
  @message = Message.new(message_params)
end

def groups_set
  @groups = current_user.groups
  @group= Group.find(params[:group_id])
  @messages = @group.messages.includes(:user)
end

end
