class MediaMetadatoAyv < MediaMetadato
	
	belongs_to :media, class_name: "MediaAyv"
	validates_presence_of :titulo, :descripcion, :tecnica, :compromiso

end
