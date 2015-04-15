require 'rails_helper'

describe User do
  let(:identity){create(:identity)}

  before :each do
    @user = build(:user)
    @user.identities << identity
    @user.save!
  end

  it {expect(@user.visible).to be}

  it 'should find from omniauth' do
    auth = {uid: identity.uid, provider: identity.provider}
    user = User.find_or_create_from_omniauth(auth)
    expect(user).to_not be_nil
  end

  it 'should create from omniauth' do
    auth = {uid: '9874', provider: 'developer'}
    user = User.find_or_create_from_omniauth(auth)
    expect(user).to_not be_nil
  end

end