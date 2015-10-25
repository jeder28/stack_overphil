require 'rails_helper'

describe 'Log in Process' do
    let(:log_in) {
        user = create(:user)
        visit login_path
        within("#login") do
            fill_in 'Username', :with => user.username
            fill_in 'Password', :with => user.password
            click_button 'Login'
        end
    }
    describe "If user is not logged in" do
        it 'should have a sign up link' do
          visit root_path
          expect(page).to have_content('register')
          expect(page).to have_content('login')
      end
  end
end

