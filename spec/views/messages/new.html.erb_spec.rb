require 'spec_helper'
  
describe "messages/new.html.erb" do
  it "should render the form" do
    render '/messages/new.html.erb'
    reponse.should have_form_putting_to(@message) 
    with_submit_button
  end
end
