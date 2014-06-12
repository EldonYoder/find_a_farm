require "rails_helper"
require "spec_helper"

describe UsersController do

  describe "POST #create" do
		context "valid user attributes" do
			it "should save user if all is valid" do
				user_attributes = FactoryGirl.attributes_for(:user)
				expect{
					post :create, user: user_attributes
				}.to change(User, :count).by(1)
			end
			# it "should be signed in if user is saved" do 
			# 	user_attributes = FactoryGirl.attributes_for(:user)
			# 	post :create, user: user_attributes
			# 	current_user.should_not be_nil
			# end
		end
	end

end