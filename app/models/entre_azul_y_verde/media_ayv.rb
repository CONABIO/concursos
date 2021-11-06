class MediaAyv < Media
	
	#belongs_to :categoria
	belongs_to :usuario, class_name: "UsuarioAyv"
	has_one :media_metadato, inverse_of: :media, foreign_key: :media_id, class_name: "MediaMetadatoAyv", dependent: :destroy
	accepts_nested_attributes_for :media_metadato, allow_destroy: true

	mount_uploader :original_filename, MediaUploader
	
end
