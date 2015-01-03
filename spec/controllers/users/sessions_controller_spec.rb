require 'spec_helper'

describe Users::SessionsController do
  let(:user) { FactoryGirl.create(:user, password: 'testpass') }

  describe "#create" do
    it "redirects to after login url" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, user: {email: user.email, password: 'testpass'}
      response.should redirect_to(user_root_path)
    end
  end
end
