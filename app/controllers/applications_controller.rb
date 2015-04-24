class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [ :edit, :update, :destroy, :show, :index]
  before_filter :check_user, only: [ :create, :edit, :update, :destroy, :show, :index]
  respond_to :html

  def index
    @applications = Application.all
    respond_with(@applications)
  end

  def show
    respond_with(@application)
  end

  def new
    @application = Application.new
    respond_with(@application)
  end

  def edit
  end

  def create
    @application = Application.new(application_params)
    @application.save
    redirect_to root_path
  end

  def update
    @application.update(application_params)
    respond_with(@application)
  end

  def destroy
    @application.destroy
    respond_with(@application)
  end

  private
    def set_application
      @application = Application.find(params[:id])
    end

    def application_params
      params.require(:application).permit(:name, :email, :hometown, :website, :comment)
    end
  def check_user
     if current_user.admin != true
       redirect_to root_path
      end
    end
end
