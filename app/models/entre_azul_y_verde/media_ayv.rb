class MediaAyv < Media
	
	has_one :media_metadato, class_name: "UsuarioAyv"
	belongs_to :categoria
	belongs_to :usuario, class_name: "UsuarioAyv"
	mount_uploader :original_filename, MediaUploader
	
end
