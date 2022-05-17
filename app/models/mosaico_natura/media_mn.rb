class MediaMn < Media
	
	belongs_to :usuario, class_name: "UsuarioMn"
	belongs_to :categoria, class_name: "CategoriaMn"
	has_one :media_metadato, inverse_of: :media, foreign_key: :media_id, class_name: "MediaMetadatoMn", dependent: :destroy
	accepts_nested_attributes_for :media_metadato, allow_destroy: true

	has_one :calificacion, inverse_of: :media, foreign_key: :media_id, class_name: "CalificacionMn"
	accepts_nested_attributes_for :calificacion, allow_destroy: true
	
	validates_presence_of :original_filename, :categoria_id

	mount_uploader :original_filename, MediaAwsUploader
	
	scope :mosaico, -> { where(categoria: (1..9)) }

	
	
	
	def genera_filename_anonimo
		[self.usuario_id, self.categoria_id, self.id, self.created_at.strftime('%Y%m%d%H%M%S'),dame_extension(self.original_filename_identifier)].join('_')
	end
end
