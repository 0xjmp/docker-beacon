require 'rails_helper'

describe V1::UsersController do
  let(:user){create(:user)}

  context 'while logged in' do
    before :each do
      sign_in user
    end

    it '#show' do
      get :show, id: user.id, format: :json
      expect(assigns(:user)).to_not be_nil
    end

    it '#update' do
      put :update, id: user.id, user: attributes_for(:user), format: :json
      expect(assigns(:user)).to_not be_nil
    end
  end

  context 'while logged out' do
    before :each do
      sign_out user
    end

    it '#show' do
      get :show, id: user.id, format: :json
      expect(assigns(:user)).to_not be_nil
    end

    it '#update' do
      put :update, id: user.id, user: attributes_for(:user), format: :json
      expect(response).to have_http_status :unauthorized
    end
  end

end