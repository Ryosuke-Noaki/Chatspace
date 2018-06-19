require 'rails_helper'

describe MessagesController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:message) { create(:message, group_id: group.id) }
  let!(:messages) { create_list(:message, 3, group_id: group.id)}
  let(:message_attributes) { attributes_for(:message) }

  describe 'GET #index' do
    context 'log in' do
      before do
        login user
        get :index, params: { group_id: group.id }
      end

      it 'assigns @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'assigns @messages' do
        group_messages = group.messages
        expect(assigns(:messages)).to eq group_messages
      end

      it 'assigns @current_user_groups' do
        expect(assigns(:current_user_groups)).to be_decorated_with Draper::CollectionDecorator
      end

      it 'assigns @group' do
        expect(assigns(:group)).to eq group
      end

      it 'renders index' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index, params: { group_id: group.id }
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'log in' do
      before do
        login user
      end

      it 'can save message' do
        expect{ post :create, params: {message: message_attributes, group_id: group.id} }.to change(Message, :count).by(1)
      end

      it 'redirects to group_messages_path' do
        post :create, params: { message: message_attributes, group_id: group.id}
        expect(response).to redirect_to(group_messages_path(group))
      end
    end

    context 'not log in' do
      it 'redirects to new_user_session_path' do
        post :create, params: {message: message_attributes, group_id: group.id}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
