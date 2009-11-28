class MessagesController < ApplicationController
  
  before_filter :require_user
  before_filter :find_room
  
  def create
    @message = Message.new(params[:message])
    @message.user = current_user
    @message.room = @room
    
    respond_to do |format|
      if @message.save
        render :juggernaut => {:type => :send_to_channel, :channel => @room.id}  do |page|
          
          
        # render :juggernaut => {:type => :send_to_all}  do |page|
          page << "$('#conversation ul').append('#{escape_javascript(render(:partial => @message))}')"
          page << "$('#conversation').animate({ scrollTop: $('#conversation').attr('scrollHeight') }, 3000);"
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
