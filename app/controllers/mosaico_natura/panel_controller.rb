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
		if params[:categoria].present?
			categoria = params[:categoria]
			@medias[categoria] = (categoria == 'cineminuto') ?  MosaicoNatura::MediaMn.desempate_video :  MosaicoNatura::MediaMn.desempate_foto.where("nombre_categoria = '#{categoria}'")
		else
			MosaicoNatura::CategoriaMn.all.each do |c|
				unless c.id==8
					@medias[c.nombre_categoria] = MosaicoNatura::MediaMn.desempate_foto.where(categoria_id: c.id).limit(10)
				else
					@medias[c.nombre_categoria] = MosaicoNatura::MediaMn.desempate_video
				end
			end
		end
	end
	
end
