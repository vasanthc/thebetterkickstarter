require "spec_helper"

describe SessionsController do

  describe "POST #create" do

    it "should allow valid users to log in" do
      user = FactoryGirl.create :user
      post :create, :user => {
        :email => user.email,
        :password => "test"
      }
      response.response_code.should_not eql(500)
    end

  end

end