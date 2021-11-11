class MosaicoNatura::InicioController < MosaicoNatura::MosaicoNaturaController
	
	def index
	end
	
	def bases
		render partial: 'bases'
	end
end
