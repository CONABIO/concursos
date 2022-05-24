class MosaicoNatura::MediaMn < Media
	
	FECHA_TERMINO_INICIAL = Date.new(2022, 01, 16)
	
	belongs_to :usuario, class_name: "UsuarioMn"
	belongs_to :categoria, class_name: "CategoriaMn"
	has_one :media_metadato, inverse_of: :media, foreign_key: :media_id, class_name: "MediaMetadatoMn", dependent: :destroy
	accepts_nested_attributes_for :media_metadato, allow_destroy: true

	has_many :calificaciones, inverse_of: :media, foreign_key: :media_id, class_name: "CalificacionMn"
	
	validates_presence_of :original_filename, :categoria_id

	mount_uploader :original_filename, MediaAwsUploader
	
	scope :mosaico, -> { where(categoria: (1..9))}
	scope :where_fotos, -> { where('posicion IS NULL').where('usuarios.concurso_id' => 2) }

	scope :select_finalistas, -> { select(:id, :original_filename, 'media_metadatos.titulo', :descripcion, :marca, :localidad, :otra_marca, :calificacion, :usuario_id, :fecha_nacimiento, :categoria_id, :created_at, :nombre_categoria) }
	
	scope :joins_finalistas, -> { left_joins(:media_metadato, :categoria, :usuario).joins(:calificaciones) }
	
	scope :finalistas, -> { select_finalistas.joins_finalistas.where_fotos }
	
	
	def genera_filename_anonimo
		[self.usuario_id, self.categoria_id, self.id, self.created_at.strftime('%Y%m%d%H%M%S'),dame_extension(self.original_filename_identifier)].join('_')
	end
	
	def age_in_completed_years(bd)
		# Difference in years, less one if you have not had a birthday this year.
		a = FECHA_TERMINO_INICIAL.year - bd.year
		a = a - 1 if (
		bd.month > FECHA_TERMINO_INICIAL.month or
				(bd.month >= FECHA_TERMINO_INICIAL.month and bd.day > FECHA_TERMINO_INICIAL.day)
		)
		a
	end
	
	def edad
		age_in_completed_years(self.fecha_nacimiento)
	end
	
end
