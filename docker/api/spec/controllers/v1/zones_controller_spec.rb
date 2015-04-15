require 'rails_helper'

describe V1::ZonesController do
  let(:user){create(:user)}
  let(:zone){create(:zone)}

  before :each do
    sign_in user
  end

  context 'while logged in' do
    it '#create' do
      post :create, zone: attributes_for(:zone), format: :json
      expect(response).to have_http_status :created
      expect(assigns(:zone)).to_not be_nil
    end

    it '#update' do
      put :update, id: zone.id, zone: attributes_for(:zone), format: :json
      expect(assigns(:zone)).to_not be_nil
      expect(response).to have_http_status :success
    end

    it '#destroy' do
      delete :destroy, id: zone.id, format: :json
      expect(assigns(:zone)).to be_nil
      expect(response).to have_http_status :no_content
    end
  end
end