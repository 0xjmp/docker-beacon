require 'rails_helper'

describe V1::SessionsController do
  before :each do
    request.env['omniauth.auth'] = OmniAuthSupport.build_strategy(:developer)
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