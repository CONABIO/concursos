class MosaicoNatura::Devise::RegistrationsController < ::Devise::RegistrationsController
  layout 'mosaico_natura'
	before_action :configure_sign_up_params, only: [:create]

  def after_sign_up_path_for(resource)
    new_mosaico_natura_registro_path
  end  
  protected
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:terms_of_service])
  end
  private
  
  def sign_up_params
    params.require(:user_mn).permit(:email, :password, :password_confirmation, :terms)
  end

end
