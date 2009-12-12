class SettingsController < ApplicationController
  
  before_filter :require_user
  before_filter :find_setting
  
  def show
  end
  
  def edit
  end
  
  def update
    if @setting.update_attributes(params[:setting])
      flash[:notice] = "Successfully updated setting."
      redirect_to settings_url
    else
      render :action => 'edit'
    end
  end
  
  def find_setting
    @setting = current_user.setting
  end
  
end
