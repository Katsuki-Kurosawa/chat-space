module ApplicationHelper

  def side_message(group)
    if  group.messages.blank?
     "新着メッセージはありません"
   elsif group.messages.order(created_at: :desc).take.body?
     group.messages.order(created_at: :desc).take.body
   else group.messages.order(created_at: :desc).take.image?
     "画像の送信がされました"
   end
 end

end
