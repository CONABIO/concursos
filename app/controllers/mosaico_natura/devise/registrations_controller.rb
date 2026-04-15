class MosaicoNatura::Devise::RegistrationsController < ::Devise::RegistrationsController
  layout 'mosaico_natura'
  
  def after_sign_up_path_for(resource)
    new_mosaico_natura_registro_path
  end  

   def after_sign_up_path_for(resource)
    new_mosaico_natura_registro_path
  end  
  protected
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:terms])
  end
  private
  
  def sign_up_params
    params.require(:user_mn).permit(:email, :password, :password_confirmation, :terms)
  end
end
