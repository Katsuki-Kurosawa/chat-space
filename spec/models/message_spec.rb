require 'rails_helper'
describe Message do
  describe '#create' do

    it "メッセージがあれば保存できる" do
      message =  build(:message, image:nil)
      expect(message).to be_valid
    end

    it "画像があれば保存できる" do
      message =  build(:message, body:nil)
      expect(message).to be_valid
    end

    it "メッセージと画像があれば保存できる" do
      message =  build(:message)
      expect(message).to be_valid
    end

    it "メッセージも画像も無いと保存できない" do
      message =  build(:message,body:nil,image:nil)
      message.valid?
      expect(message.errors[:body]).to include("translation missing: ja.activerecord.errors.models.message.attributes.body.blank")
      expect(message.errors[:image]).to include("translation missing: ja.activerecord.errors.models.message.attributes.image.blank")
    end

    it "group_idが無いと保存できない" do
      message =  build(:message,group_id:nil)
      message.valid?
      expect(message.errors[:group_id]).to include("translation missing: ja.activerecord.errors.models.message.attributes.group_id.blank")
    end

    it "user_idが無いと保存できない" do
      message =  build(:message,user_id:nil)
      message.valid?
      expect(message.errors[:user_id]).to include("translation missing: ja.activerecord.errors.models.message.attributes.user_id.blank")
    end
  end
end
