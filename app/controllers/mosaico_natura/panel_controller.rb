class MosaicoNatura::PanelController < MosaicoNatura::MosaicoNaturaController
	before_action :authenticate, only: %i[ calificacion desempate]
	
	def calificacion
		@fotos = {}
		MosaicoNatura::CategoriaMn.all.each do |c|
			@fotos[c.nombre_categoria] = MosaicoNatura::MediaMn.finalistas.where(categoria_id: c.id)
		end
	
	end
	
	def desempate
		@fotos = {}
	end
	
end
