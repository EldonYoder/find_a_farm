FactoryGirl.define do 

	factory :user do |user|
	  user.name 								 "Yeuen"
	  user.email                 "yingkityuen@example.com"
	  user.password              "password"
	  user.password_confirmation "password"
	end

	factory :invalid_user, class: :user do |f|
		f.name nil
	end

end