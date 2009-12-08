class RoomsController < ApplicationController
  
  before_filter :require_user, :except => [:index]
  
  def index
    @rooms = Room.all
  end
  
  def show
    @room = Room.find(params[:id])
    @messages = Message.for_room(params[:id]).reverse
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params[:room])
    if @room.save
      flash[:notice] = "Successfully created room."
      redirect_to @room
    else
      render :action => 'new'
    end
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      flash[:notice] = "Successfully updated room."
      redirect_to @room
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "Successfully destroyed room."
    redirect_to rooms_url
  end
end
