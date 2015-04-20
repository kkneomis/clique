class PagesController < ApplicationController
  before_filter :check_user, only: [:manage]
  def home
  end

  def about
  end

  def contact
  end
  
  def manage
    @users=User.all
  end
  
  def shop
  end
  
  def meet
    #@users=User.all
    @users=User.where(member: true)
  end
  
  def join
  end
  private
    # Use callbacks to share common setup or constraints between actions.

     def check_user
       if current_user.admin != true
         redirect_to :back, alert: "You must be an administrator to do this"\
      end
    end
  
end
