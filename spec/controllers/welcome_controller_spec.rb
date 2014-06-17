require "rails_helper"

describe WelcomeController do
  
  describe "GET #index" do

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns a collection of farms " do 
      @user = FactoryGirl.create(:user)
      @user.farms << FactoryGirl.create(:farm)
      get :index
      assigns(:recent_farms).count.should eq(1)
    end

  end
end