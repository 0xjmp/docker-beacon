describe Zone do
  before :each do
    @zone = create(:zone)
  end

  it{expect(@zone.name).to_not be_nil}
  it{expect(@zone.radius).to_not be_nil}
  it{expect(@zone.latitude).to_not be_nil}
  it{expect(@zone.longitude).to_not be_nil}
  it{expect(@zone.user).to_not be_nil}
  it{expect(@zone.visible).to be}

end