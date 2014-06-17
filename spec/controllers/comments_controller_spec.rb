require "rails_helper"

describe CommentsController do

  # before(:each) do
  #   @request.env["devise.mapping"] = Devise.mappings[:user]
  #   @user = FactoryGirl.create(:user)
  #   sign_in @user
  # end
   
  describe "for signed in user" do

    it "should allow signed in user to comment" 
    # do 
    #   @farm = FactoryGirl.create(:farm)
    #   @user.farms << @farm
    #   comment_attributes = FactoryGirl.attributes_for(:comment)
    #   request.env["HTTP_REFERER"] = "/farms/#{@farm.id}"
    #   expect{
    #     post :create, comment: comment_attributes
    #   }.to change(Comment, :count).by(1)
    # end

    it "should not allow someone not signed in to comment"

  end
end