class MessagesController < ApplicationController

  def index    #ホーム画面
    @groups = current_user.groups
    @group= Group.find(params[:group_id])
    @message = Message.new
  end

  def create   #メッセージ送信、保存
    @message = Message.create(body:message_params[:body], image:message_params[:image], group_id:params[:group_id], user_id: current_user.id)
    if @message.save
      redirect_to group_messages_path, notice: "メッセージを送信しました"
    else
      flash[:alert] = "メッセージを入力してください"
      redirect_to group_messages_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image)
  end

end
