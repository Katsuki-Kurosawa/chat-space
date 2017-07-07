class MessagesController < ApplicationController

  before_action :set_group_messages, only: [:index, :create]

  def index
    @message = Message.new
     respond_to do |format|
     format.html
     format.json { @new_message = @group.messages.where('id > ?', params.require(:message)[:id])}
    end
  end

  def create   #メッセージ送信、保存
   @message = Message.new(message_params)
   if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path}
        format.json
      end
   else
    render :index
   end
  end

private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id,
      group_id: params[:group_id])
  end

  def set_group_messages
    @group = Group.find(params[:group_id])
    @messages = @group.messages.order(created_at: :ASC).includes(:user)
  end

end
