class MessagesController < ApplicationController

  before_action :groups_set

  def index    #ホーム画面
   @message = Message.new
   @messages = @group.messages
 end

  def create   #メッセージ送信、保存
   @message = Message.new(message_params)
   if @message.save
    redirect_to group_messages_path, notice: "メッセージを送信しました"
  else
    flash[:alert] = "メッセージを入力してください"
    render :index
  end
end

 private

 def message_params
  params.require(:message).permit(:body, :image).merge(user_id: current_user.id,
    group_id: params[:group_id])
 end

 def groups_set
  @groups = current_user.groups
  @group= Group.find(params[:group_id])
 end

end
