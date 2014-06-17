require "spec_helper"
require "rails_helper"
include AuthenticationHelper

feature "Authentication" do
	
	let(:user) { FactoryGirl.create(:user) }
	# let(:invalid_user) { FactoryGirl.create(:invalid_user) }

	scenario "should redirect to user/:id path on login" do
		login(user)
		current_path.should eq("/users/#{user.id}")
	end

	scenario "trying to log in w/ incorrect pw" do
		invalid_login(user)
		current_path.should eq("/users/sign_in")
	end

	scenario "creating an account w/ valid values" do
		visit "/users/sign_up"
		fill_in "user_email", with: "harold@example.com"
		fill_in "user_name", with: "harold"
		fill_in "user_password", with: "Nodle098" 
		fill_in "user_password_confirmation", with: "Nodle098"
		
		click_button "Sign up"

		expect(page).to have_content('Log Out')
		expect(page).to have_content('Logged in as')
	end

	scenario "creating an account w/ invalid values" do 
		visit "/users/sign_up"
		fill_in "user_email", with: "harold@example.com"
		fill_in "user_name", with: "harold"
		fill_in "user_password", with: "Nodle098" 
		fill_in "user_password_confirmation", with: "Nod098"
		
		click_button "Sign up"

		expect(page).to have_content("Password confirmation doesn't match Password")
	end


end