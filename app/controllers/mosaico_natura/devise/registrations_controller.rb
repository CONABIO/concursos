class MosaicoNatura::Devise::RegistrationsController < ::Devise::RegistrationsController
  layout 'mosaico_natura'

  def after_sign_up_path_for(resource)
    new_mosaico_natura_registro_path
  end  
end
