class MediaMn < Media
	
	#belongs_to :categoria
	belongs_to :usuario, class_name: "UsuarioMn"
	has_one :media_metadato, inverse_of: :media, foreign_key: :media_id, class_name: "MediaMetadatoMn", dependent: :destroy
	accepts_nested_attributes_for :media_metadato, allow_destroy: true

	validates_presence_of :original_filename

	mount_uploader :original_filename, MediaUploader
	
end
