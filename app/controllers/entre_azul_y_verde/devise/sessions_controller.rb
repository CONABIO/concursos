class EntreAzulYVerde::Devise::SessionsController < ::Devise::SessionsController
  layout 'entre_azul_y_verde'

  private

  def after_sign_in_path_for(resource)
		@registro = UsuarioAyv.where(user_id: resource.id).first

		if @registro.present?
			edit_entre_azul_y_verde_registro_path(@registro)
		else  # Es nuevo usuario
      new_entre_azul_y_verde_registro_path
		end
  end

end