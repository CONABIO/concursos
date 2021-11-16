class MediaMetadatoMn < MediaMetadato
	
	belongs_to :media, class_name: "MediaMn"
	validates_presence_of :titulo, :descripcion, :tecnica, :compromiso

end
