class AdminController < ApplicationController
  before_action :check_admin
  before_action :set_user, only: [:include, :kick]
  before_filter :check_admin
  
  

  def items
    @items= Item.all
  end

  def members
    @users= User.all
  end
  
  def invite
    @user.member = true
  end
  
  def kick
    @user.member= false
  end
  
  private
  def check_admin
    if !current_user.admin?
      redirect_to root_url, alert: "Sorry, you must be an admnistrator to view this page"\
        end
  end  
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:invite) << :member
  end
  
end
