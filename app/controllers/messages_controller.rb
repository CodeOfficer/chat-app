class MessagesController < ApplicationController
  
  before_filter :find_room
  
  def create
    @message = Message.new(params[:message])
    
    respond_to do |format|
      if @message.save
        channel = [params[:room_id]]
        message = "<div class='message'> <b>user</b>: #{params[:message][:body]}</div>"  
        render :juggernaut => {:type => :send_to_all, :channels => channel }  do |page|
          page << "$('#conversation ul').append('<li>#{escape_javascript(message)}</li>')"
        end
        format.json { render :json => @message } 
      else
        format.json { render :json => { :errors => @message.errors.full_messages } }
      end
    end
  end
  
  # private --------------------------------------------------------------------
  
  def find_room
    @room = Room.find params[:room_id]
  end
end
