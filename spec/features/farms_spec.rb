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

 	scenario "signed in user tries to create an invalid farm" do
		login(user)

		create_farm

		click_button "Edit this Farm"

		
 	end

	
end