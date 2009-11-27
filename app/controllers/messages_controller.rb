class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = "Successfully created message."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
