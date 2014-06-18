module FarmHelper

	def create_farm
		visit "/farms/new"
		fill_in "farm_name", with: "What A Cool Farm"
		fill_in "farm_description", with: "We do the coolest stuff."
		fill_in "farm_address", with: "1234 Browns Mill Road, Rustburg VA 24588"
		fill_in "farm_hours_open", with: "8 a.m. till 4 p.m."
		fill_in "farm_days_open", with: "Mon - Fri"
		fill_in "farm_months_open", with: "Year Round"
		fill_in "farm_phone_num", with: "454-987-1537"
		fill_in "farm_email_address", with: "coolness@example.com"
		click_button "Add Your Farm"
	end

	def create_invalid_farm
		visit "/farms/new"
		fill_in "farm_name", with: ""
		fill_in "farm_description", with: "We do the coolest stuff."
		fill_in "farm_address", with: "1234 Browns Mill Road, Rustburg VA 24588"
		fill_in "farm_hours_open", with: "8 a.m. till 4 p.m."
		fill_in "farm_days_open", with: "Mon - Fri"
		fill_in "farm_months_open", with: "Year Round"
		fill_in "farm_phone_num", with: "454-987-1537"
		fill_in "farm_email_address", with: "coolness@example.com"
		click_button "Add Your Farm"

	end

end