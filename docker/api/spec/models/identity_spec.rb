require 'rails_helper'

describe Identity do
  let(:identity){create(:identity)}

  it {expect(identity.user).to_not be_nil}
  it {expect(identity.uid).to_not be_nil}
  it {expect(identity.provider).to_not be_nil}

end