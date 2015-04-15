require 'rails_helper'

describe V1::SessionsController do
  let(:user){create(:user)}

  before :each do
    request.env['omniauth.auth'] = OmniAuthSupport.build_strategy(:developer)
  end

  context 'while logged in' do
    before :each do
      sign_in user
    end

    it '#create' do
      get :create, provider: 'developer', format: :json
      expect(response).to have_http_status :success
    end

    it '#destroy' do
      post :destroy, format: :json
      expect(response).to have_http_status :no_content
    end
  end

  context 'while logged out' do
    before :each do
      sign_out user
    end

    it '#create' do
      get :create, provider: 'developer', format: :json
      expect(response).to have_http_status :success
    end

    it '#destroy' do
      post :destroy, format: :json
      expect(response).to have_http_status :unauthorized
    end
  end
end