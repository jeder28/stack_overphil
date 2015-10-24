require 'rails_helper'

describe UsersController do
  describe 'GET#new' do
    it "creates a new user" do
      get :new
      expect(assigns(:user)).to be_a(User)
      end
    end

    let(:user) { attributes_for(:user) }


  describe 'POST#create' do
    describe "when successful" do
      let(:user_params) { { user: attributes_for(:user_params) } }

      it "creates a user" do
        post(:create, user_params)
        expect(response).to redirect_to(root_path)
      end

      it "increased the number of users in the database by 1" do
        expect{post(:create, user_params)}.to change{User.count}.by(1)
      end
    end

    describe "when unsuccessful" do
      it "redirects to the login page" do
        post(:create, user: { username: nil, password: nil })
        expect(response).to redirect_to(login_path)
      end
    end

  end
end