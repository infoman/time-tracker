module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryBot.create(:user, :admin)
    end
  end

  def login_manager
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryBot.create(:user, :manager)
    end
  end

  def login_user(owner: false)
    before(:each) do
      user = (owner && @user.present?) ? @user : FactoryBot.create(:user)

      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  end
end
