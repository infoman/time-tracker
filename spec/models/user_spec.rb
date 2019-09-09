require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one(:profile) }
  it { should define_enum_for(:role) }

  it "should map role id to specific role" do
    expect(User.roles).to include({
      user: 0,
      manager: 1,
      admin: 2
    })
  end

  it "should have a profile after creation" do
    user = create :user

    expect(user.profile).to be_a Profile
  end
end
