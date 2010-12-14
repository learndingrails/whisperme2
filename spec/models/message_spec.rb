require 'spec_helper'

describe Message do
   it "should create a new Message given valid attributes" do
      Message.make
   end

   it "should not be empty" do
      blank_message = Message.make(:msg=>"")
      blank_message.should_not be_valid
   end

   it "should be less than 2500 characters long" do  
      long_msg = "A" * 2501
      long_message = Message.make(:msg=>long_msg)
      long_message.should_not be_valid
   end
end