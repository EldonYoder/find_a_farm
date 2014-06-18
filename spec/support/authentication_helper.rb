module AuthenticationHelper

	def login(user)
		visit "/users/sign_in"
		fill_in "user_email", with: user.email
		fill_in "user_password", with: user.password
		click_button "Sign in"
	end

	def invalid_login(user)
		visit "/users/sign_in"
		fill_in "user_email", with: "dog eat chicken"
		fill_in "user_password", with: user.password
		click_button "Sign in"
	end

end