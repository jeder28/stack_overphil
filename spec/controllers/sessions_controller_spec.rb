require 'rails_helper'

describe SessionsController do
    describe "POST #create" do
        describe "When succesful" do
            before(:each) {
        @user = create(:user) 
        post :create, session: { username: user[:username], password: user[:password] }
      }
      let(:user) { attributes_for(:user) }

      pending "redirects homepage" do 
        expect(response).to redirect_to(root_path)
      end

      pending "sets session to the user_id" do
        expect(session[:user_id]).to eq(@user.id)
      end
    end

    describe "When unsuccesful" do
      before(:each){
        post :create, session: { username: 'nil', password: 'nil' }
      }

      it "renders new login page" do 
        expect(response).to render_template(:new)
      end

      it "no session is set" do
        expect(session[:user_id]).to be_nil
      end
    end
  end
  
  describe "GET#delete" do
    pending "redirects homepage" do 
      session[:user_id] = 1
      delete :destroy
      expect(response).to redirect_to(root_path)
    end

    pending "expects a flash message" do
      session[:user_id] = 1
      delete :destroy
      expect(flash[:message]).to have_content "Successful logout. See you next time!"
    end
  end
end
