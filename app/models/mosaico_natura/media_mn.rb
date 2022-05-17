class MediaMn < Media
	
	belongs_to :usuario, class_name: "UsuarioMn"
	belongs_to :categoria, class_name: "CategoriaMn"
	has_one :media_metadato, inverse_of: :media, foreign_key: :media_id, class_name: "MediaMetadatoMn", dependent: :destroy
	accepts_nested_attributes_for :media_metadato, allow_destroy: true

	has_many :calificaciones, inverse_of: :media, foreign_key: :media_id, class_name: "CalificacionMn"
	
	validates_presence_of :original_filename, :categoria_id

	mount_uploader :original_filename, MediaAwsUploader
	
	scope :mosaico, -> { where(categoria: (1..9))}
	scope :where_fotos, -> { where('posicion IS NULL').where('usuarios.concurso_id' => 2) }

	scope :select_finalistas, -> { select(:id, :original_filename, 'media_metadatos.titulo', :descripcion, :marca, :localidad, :otra_marca, :calificacion, :usuario_id, :categoria_id, :created_at, :nombre_categoria) }
	
	scope :joins_finalistas, -> { left_joins(:media_metadato, :categoria, :usuario).joins(:calificaciones) }
	
	scope :finalistas, -> { select_finalistas.joins_finalistas.where_fotos }
	
	
	def genera_filename_anonimo
		[self.usuario_id, self.categoria_id, self.id, self.created_at.strftime('%Y%m%d%H%M%S'),dame_extension(self.original_filename_identifier)].join('_')
	end
end
