FactoryGirl.define do 
	
	factory :farm do |f|
		f.name "Awesome Farm"
		f.description "Still an Awesome Farm"
		f.address "1234 Browns Mill Road, Rustburg VA 24588"
		f.hours_open "8 a.m. till 7 p.m."
		f.days_open "Mon - Fri"
		f.months_open "Year Round"
		f.phone_num "(098)-234-2344"
		f.email_address "fakeemail@example.com"
	end

	factory :invalid_farm, class: :farm do |f2|
		f2.name nil
	end

end