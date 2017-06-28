require 'rails_helper'

describe MessagesController  do
let(:group){ FactoryGirl.create(:group) }
let(:user){ @user = create(:user) }
let(:message){ message = Message.new }

  describe 'ログインしている時' do
    before do
      sign_in user
    end

    describe 'GET #index' do
      it "該当するビューが描画されているか" do
       get :index, params:{group_id: group}
       expect(response).to render_template :index
     end

     it "messageが期待される値を持つ" do
      get :index, params:{group_id: group}
      expect(assigns(:message)).to be_a_new(Message)
     end

    it "groupが期待される値を持つ" do
      get :index, params:{group_id: group}
      expect(assigns(:group)).to eq group
    end
  end

  describe 'POST #create' do
    context "メッセージが保存できた時" do

      it "メッセージの保存はできたのか" do
        expect{
          post :create, params: { message: attributes_for(:message, { body: 'test'}), group_id:group.id }
          }.to change(Message, :count).by(1)
      end

        it "意図した画面に遷移しているか" do
          post :create, params:{message: attributes_for(:message, { body: 'test'}), group_id:group.id }
          expect(response).to redirect_to group_messages_path
        end
      end

      context "メッセージが保存できなかった時" do
       it "メッセージが保存されない" do
        expect(message.save).to be_falsey
       end

       it "意図したビューにリダイレクトできているか" do
        get :index, params:{group_id: group}
        expect(response).to render_template(:index)
       end
    end
  end
end

  describe 'ログインしていない場合' do
    it "ログインしていない場合に意図したビューにリダイレクトされるか" do
      get :index,params:{group_id:group}
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
