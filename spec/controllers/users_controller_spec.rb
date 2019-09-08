require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe UsersController, type: :controller do
  before :each do
    @user = create :user
  end

  describe "GET #index" do
    before :each do
      create_list :user, 9
    end

    it "returns a success response" do
      get :index, params: {}

      expect(response).to be_successful
    end

    it "generates a list of users" do
      get :index, params: {}

      expect(assigns(:users).count).to eq(10)
      expect(assigns(:users)).to include(@user)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: @user.to_param}

      expect(response).to be_successful
    end

    it "has a user to display" do
      get :show, params: {id: @user.to_param}

      expect(assigns(:user)).to eq(@user)
    end
  end

  describe "DELETE #destroy" do
    describe "as an admin" do
      login_admin

      it "destroys the requested user" do
        expect {
          delete :destroy, params: {id: @user.to_param}
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        delete :destroy, params: {id: @user.to_param}

        expect(response).to redirect_to(users_url)
      end
    end

    describe "as a regular user" do
      login_user

      it "refuses to destroy the requested user" do
        expect {
          delete :destroy, params: {id: @user.to_param}
        }.to raise_error(CanCan::AccessDenied).and avoid_changing(User, :count)
      end
    end
  end
end
