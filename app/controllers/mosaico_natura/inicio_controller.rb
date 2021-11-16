class MosaicoNatura::InicioController < MosaicoNatura::MosaicoNaturaController
	
	def index
		@categorias = Categoria::CategoriasMN
	end
	
	def bases
		render partial: 'bases'
	end
	
	def terminos_condiciones
	end
end
