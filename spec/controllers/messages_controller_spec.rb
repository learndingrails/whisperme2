require 'spec_helper'

describe MessagesController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

#  describe "GET 'show'" do
#    it "should be successful" do
#      get 'show'
#      response.should be_success
#    end
#  end

  describe "POST 'create'" do
  	describe "failure" do
		  before(:each) do
			  @attr = {:msg => ""}
		  end

		  it "should not create a message" do
			  lambda do
				  post :create, :message => @attr
			  end.should_not change(Message, :count)
		  end
		  
		  it "when message is missing, should cause a relevant error to be displayed" do
		    post :create, :message => @attr
		    response.should_include "blank"
	    end
	    
	    it "when message is too long, should cause a relevant error to be displayed" do
        long_message = "a"*2501
        post :create, :message => {:msg => long_message}
  		  response.should_include "long"
      end
	  end
	  
	  describe "success" do
      before(:each) do
        @attr = {:msg => "this message is valid"}
      end
      
      it "should create a message" do
        lambda do
          post :create, :message => @attr
        end.should change(Message,:count).by(1)
      end
      
      it "should redirect to the new message page" do
        post :create, :message => @attr
        response.should redirect_to(new_message_path)
      end  
    end
  end
end

