class EntreAzulYVerde::Devise::RegistrationsController < ::Devise::RegistrationsController
  layout 'entre_azul_y_verde'

  # SALTAR COMPLETAMENTE la verificación de autenticación
  skip_before_action :require_no_authentication, only: [:new, :create]

  # Opcional: Cerrar sesión actual antes de registrar nuevo usuario
  prepend_before_action :logout_current_user, only: [:new, :create]

  def logout_current_user
    if user_signed_in? && current_user.is_a?(User)
      sign_out current_user
      flash[:notice] = "Sesión anterior cerrada. Puedes crear una nueva cuenta."
    end
  end

  def resource_class
    UserAyv
  end

  def resource_name
    :user_ayv
  end

  def after_sign_up_path_for(resource)
    new_entre_azul_y_verde_registro_path
  end

  # Asegurar que build_resource use UserAyv
  def build_resource(hash = {})
    self.resource = UserAyv.new(hash)
  end
end
