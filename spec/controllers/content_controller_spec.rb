require 'spec_helper'

describe ContentController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @user.add_role :instructor # gives the user a role. tests pass regardless of role
  end

  describe "GET 'admin'" do
    it "returns http success" do
      get 'admin'
      response.should @user.has_role?(:admin) ? be_success : redirect_to(root_url)
    end
  end

  describe "GET 'instructor'" do
    it "returns http success" do
      get 'instructor'
      response.should @user.has_role?(:instructor) ? be_success : redirect_to(root_url)
    end
  end

  describe "GET 'student'" do
    it "returns http success" do
      get 'student'
      response.should @user.has_role?(:student) ? be_success : redirect_to(root_url)
    end
  end

end
