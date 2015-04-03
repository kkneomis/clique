class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end
  
  def shop
  end
  
  def meet
    @users=User.all
  end
  
  def join
  end
  
  
end
