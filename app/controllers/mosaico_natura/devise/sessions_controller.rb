class MosaicoNatura::Devise::SessionsController < ::Devise::SessionsController
  layout 'mosaico_natura'

  private

  def after_sign_in_path_for(resource)
    registro = MosaicoNatura::UsuarioMn.find_by(user_id: resource.id)

    if registro.present?
      mosaico_natura_registro_path(registro)
    else
      new_mosaico_natura_registro_path
    end
  end
end