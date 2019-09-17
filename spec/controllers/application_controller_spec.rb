require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def access_denied
      raise CanCan::AccessDenied, 'Test message'
    end
  end

  describe "handles CanCan::AccessDenied exception" do
    before :each do
      routes.draw { get "access_denied" => "anonymous#access_denied" }
    end

    it "redirects to the previous page" do
      request.env['HTTP_REFERER'] = users_url

      get :access_denied

      expect(response).to redirect_to :users
    end

    it "redirects to the home page if no referer set" do
      get :access_denied

      expect(response).to redirect_to :root
    end

    it "sets flash alert message" do
      get :access_denied

      expect(flash[:alert]).to eq 'Test message'
    end
  end
end
