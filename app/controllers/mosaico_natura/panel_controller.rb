class MosaicoNatura::PanelController < MosaicoNatura::MosaicoNaturaController
	before_action :authenticate, only: %i[ calificacion desempate]
	
	def calificacion
		@fotos = {}
		MosaicoNatura::CategoriaMn.all.each do |c|
			@fotos[c.nombre_categoria] = MosaicoNatura::MediaMn.finalistas.where(categoria_id: c.id)
		end
	
	end
	
	def desempate
		@medias = {}
		MosaicoNatura::CategoriaMn.all.each do |c|
			unless c.id==8
				@medias[c.nombre_categoria] = MosaicoNatura::MediaMn.desempate_foto.where(categoria_id: c.id)
			else
				@medias[c.nombre_categoria] = MosaicoNatura::MediaMn.desempate_video
			end
		end
	
	end
	
end
