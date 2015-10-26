require 'rails_helper'

describe 'Log in Process' do
    let(:log_in) {
        user = create(:user)
        visit login_path
        within("#login") do
            fill_in 'Username', :with => user.username
            fill_in 'Password', :with => user.password
            click_button 'login'
        end
    }
    describe "If user is not logged in" do
        it 'should have a register link' do
          visit root_path
          expect(page).to have_content('register')
          expect(page).to have_content('login')
      end
  end

  describe "when user is logged in" do
    pending 'should replace register link with logout' do
        log_in
        expect(page).to have_content('Ask Question')
        expect(page).to have_content('Tags')
        expect(page).to have_content('logout')
    end

    pending "should log me out" do
      log_in
      click_link 'logout'
      expect(page).to have_content('register')
      expect(page).to have_content('login')
  end
end
end

describe "Register process" do
  let(:user_attr){attributes_for(:user)}
  describe "Valid user" do 
    it "links to the right register page" do 
      visit root_path
      click_link 'register'
      expect(page).to have_content("Register")
      expect(page).to have_field("Email")
      expect(page).to have_field("Username")
      expect(page).to have_field("Password")
    end
end
end