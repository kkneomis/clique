class UsersController < ApplicationController
  before_action :set_user, only: [:show, :join, :kick]
  before_filter :authenticate_user!, only: [:join, :kick]
  before_filter :check_user, only: [:join, :kick, :manage]
  before_filter :check_member, only: [:show]
  
  def show
    @items=@user.items
      respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
      end
  end
  
  def join
    @user.update_attribute :member, true
    redirect_to @user
  end
  
  def kick
    @user.update_attribute :member, false
    redirect_to @user
  end

 
  

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
     def check_user
       if current_user.admin != true
         redirect_to :back, alert: "You must be an administrator to do this"\
      end
    end
    def check_member
      if (user_signed_in?) && (current_user.admin ==true)
      elsif @user.member != true
        redirect_to root_url, alert: "This User is not a Clique Member"\
      end
    end
  
end
