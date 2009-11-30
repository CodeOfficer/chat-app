class JuggernautController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  
  def login
    @user = User.find(params[:client_id])
    channels = params[:channels].collect{|channel| channel.to_i}
	  render :juggernaut => {:type => :send_to_channels, :channels => channels } do |page|
      page << "$('#conversation ul').append('#{escape_javascript(render(:partial => 'messages/entered', :locals => {:user => @user}))}')"
      page << "$('#conversation').animate({ scrollTop: $('#conversation').attr('scrollHeight') }, 3000);"
	  end
    Juggernaut.show_clients_for_channel_and_post channels
    render :nothing => true
  end
  
  def users
    users = User.find(params[:clients])
    channels = params[:channels].collect{|channel| channel.to_i}
    render :juggernaut => {:type => :send_to_channels, :channels => channels } do |page|
      page << "$('#users_list').html('#{escape_javascript(render(:partial => 'rooms/user_list', :locals => {:users => users}))}')"
    end
    render :nothing => true
  end
  
  def connection_logout
	  @user = User.find(params[:client_id])
	  channels = params[:channels].collect{|channel| channel.to_i}
	  Juggernaut.remove_channels_from_clients(@user.id, channels)
    render :juggernaut => {:type => :send_to_channels, :channels => channels } do |page|
      page << "$('#conversation ul').append('#{escape_javascript(render(:partial => 'messages/left', :locals => {:user => @user}))}')"
      page << "$('#conversation').animate({ scrollTop: $('#conversation').attr('scrollHeight') }, 3000);"
    end
    Juggernaut.show_clients_for_channel_and_post channels
    render :nothing => true
  end
  
  def logout
    render :nothing => true
  end
  
end
