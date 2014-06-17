require "spec_helper"
require "rails_helper"
include AuthenticationHelper
include FarmHelper

feature "Farms" do
	
	let(:user) { FactoryGirl.create(:user) }
	# let(:invalid_user) { FactoryGirl.create(:invalid_user) }

	scenario "signed in user should be able to create/edit a farm" do
		login(user)

		create_farm

		expect(page).to have_content("1234 Browns Mill Road, Rustburg VA 24588")

		click_button "Edit this Farm"

		expect(page).to have_content("example: May, June, July, Year Round")

		fill_in "farm_phone_num", with: "454-000-1537"

		click_button "Update Your Farm"

		expect(page).to have_content("updated successfully")

 	end

 	scenario "user adds/edits/deletes link to farm" do
		login(user)

		create_farm

		click_button "Edit this Farm"

		click_button "Add Link to this Farm"

		fill_in "link_name", with: "Google"
		fill_in "link_url", with: "https://www.google.com/"

		click_button "Add Link"

		expect(page).to have_content("Google")
		expect(page).to have_content("https://www.google.com/")

		click_link "Edit Link"

		expect(page).to have_content("Edit the following link")

		fill_in "link_name", with: "Google!"

		click_button "Update Link"

		expect(page).to have_content("Link updated")

		click_link "Delete Link"

		expect(page).to have_content("Link Deleted")
		
 	end

	
end