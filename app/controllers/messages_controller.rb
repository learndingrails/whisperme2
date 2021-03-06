class MessagesController < ApplicationController
  def new
     @message = Message.new
  end
  
  def index
    @messages = Message.all
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
	    flash[:failure] = "Unable to Post Message."
		  render new_message_path
	  end
  end
end