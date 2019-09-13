require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one(:profile) }
  it { should have_many(:time_records) }
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

  describe "#display_name" do
    before :each do
      @user = build :user
    end

    context "with full name defined in profile settings" do
      it "should return user's full name" do
        @user.profile.full_name = 'Really Full Name'

        expect(@user.display_name).to eq('Really Full Name')
      end
    end

    context "without a full name" do
      it "should return user's e-mail address" do
        @user.profile.full_name = nil

        expect(@user.display_name).to eq(@user.email)
      end
    end
  end
end
