class MosaicoNatura::PanelController < MosaicoNatura::MosaicoNaturaController
	
	def calificacion
		@fotos = {}
		CategoriaMn.all.each do |c|
			@fotos[c.nombre_categoria] = MediaMn.mosaico.where(categoria_id: c.id)
		end
	
	end
	
	def desempate
		@fotos = {}
	end
	
end
