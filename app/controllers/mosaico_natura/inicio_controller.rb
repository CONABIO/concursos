class MosaicoNatura::InicioController < MosaicoNatura::MosaicoNaturaController
	
  def index
	  @categorias = Categoria::CategoriasMN
    @registro = MosaicoNatura::UsuarioMn.find_by(user_id: current_user_mn.id)	if current_user_mn.present?
  end
	
	def bases
		render partial: 'bases'
	end
	
	def terminos_condiciones
	end
end
