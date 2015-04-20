class RegistrationsController < Devise::RegistrationsController

  protected

  def params
    params[:user].permit(:member)
  end
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end