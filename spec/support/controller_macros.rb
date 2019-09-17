module ControllerMacros
  def login_admin(owner: false)
    before(:each) do
      user = if (owner && @user.present?)
        @user.update_attribute :role, :admin
        @user.reload
      else
        FactoryBot.create(:user, :admin)
      end

      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  end

  def login_manager(owner: false)
    before(:each) do
      user = if (owner && @user.present?)
        @user.update_attribute :role, :manager
        @user.reload
      else
        FactoryBot.create(:user, :manager)
      end

      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  end

  def login_user(owner: false)
    before(:each) do
      user = if (owner && @user.present?)
        @user.update_attribute :role, :user
        @user.reload
      else
        FactoryBot.create(:user)
      end

      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  end
end
