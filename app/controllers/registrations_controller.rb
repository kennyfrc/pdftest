class RegistrationsController < Devise::RegistrationsController
 
  # add two private methods here
  private
  # this overwrites devise's parameters
  # reason being you want to add a name here.. then go to migration
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end