require 'spec_helper'

describe Message do
   before (:each) do
      @attr = {:msg => "sample message yay"}
   end

   it "should create a new Message given valid attributes" do
      Message.create!(@attr)
   end

   it "should not be empty" do
      blank_message = Message.new(@attr.merge(:msg => ""))
      blank_message.should_not be_valid
   end

   it "should be less than 2500 characters long" do  
      long_msg = "A" * 2501
      long_message = Message.new(@attr.merge( :msg => long_msg))
      long_message.should_not be_valid
   end

end
