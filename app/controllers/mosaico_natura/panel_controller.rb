class MosaicoNatura::PanelController < MosaicoNatura::MosaicoNaturaController
	before_action :authenticate, only: %i[ calificacion desempate]
	
	def calificacion
		@fotos = {}
		CategoriaMn.all.each do |c|
			@fotos[c.nombre_categoria] = MediaMn.finalistas.where(categoria_id: c.id)
		end
	
	end
	
	def desempate
		@fotos = {}
	end
	
end
