require 'rails_helper'
describe Message do
  describe '#create' do

   context  '・メッセージを保存できる場合 ' do
     let(:messages){ FactoryGirl.build(:message) }

     it "メッセージがあれば保存できる" do
       messages[:image] = nil
       expect(messages).to be_valid
     end

     it "画像があれば保存できる" do
       messages[:body] = nil
       expect(messages).to be_valid
     end

     it "メッセージと画像があれば保存できる" do
      expect(messages).to be_valid
    end
  end

  context  '・メッセージを保存できない場合 ' do
    let(:messages) { FactoryGirl.build(:message,body:nil,image:nil,group_id:nil,user_id:nil) }
    it "メッセージも画像も無いと保存できない" do
     messages.valid?
     expect(messages.errors[:body]).to include("を入力してください")
     expect(messages.errors[:image]).to include("を入力してください")
   end


   it "group_idが無いと保存できない" do
    messages.valid?
    expect(messages.errors[:group_id]).to include("を入力してください")
  end

  it "user_idが無いと保存できない" do
   messages.valid?
   expect(messages.errors[:user_id]).to include("を入力してください")
 end
end
end
end

