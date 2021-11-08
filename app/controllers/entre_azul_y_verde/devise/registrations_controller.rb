class EntreAzulYVerde::Devise::RegistrationsController < ::Devise::RegistrationsController
  layout 'entre_azul_y_verde'

  def after_sign_up_path_for(resource)
    new_entre_azul_y_verde_registro_path
  end  
end
