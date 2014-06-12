FactoryGirl.define do 

	factory(:user) do |f|
		f.name "Bob"
		f.email "bob@example.com"
		f.password "password"
		f.password_confirmation "password"
	end

	# factory(:invalid_user) do
	# 	email nil
	# 	password "jopassword"
	# 	password_confirmation "jopassword"
	# end

end