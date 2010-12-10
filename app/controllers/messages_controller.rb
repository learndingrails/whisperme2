class MessagesController < ApplicationController
  def new
     @message = Message.new
  end

  def show
     @message = Message.find(params[:id])
  end

  def create
	  @message = Message.new(params[:message])
	  if @message.save
		  flash[:success] = "Message Posted."
		  redirect_to new_message_path
	  else
	    flash[:success] = "fail."
		  redirect_to new_message_path
	  end
  end

end
