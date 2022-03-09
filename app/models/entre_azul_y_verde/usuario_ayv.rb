class UsuarioAyv < Usuario
	
	CONCURSO = "ayv".freeze
	MEDIO = [["Redes sociales", "redes-sociales"], ["Radio", "radio"], ["Televisión", "television"], ["En la escuela", "escuela"], ["Otro", "otro"]]
	FECHA_NAC_MIN = "2003-01-01"
	FECHA_NAC_MAX = "2016-01-01"
	FECHA_TERMINO = Date.new(2022,02,28)
	
	validates_presence_of :nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :lugar_nacimiento, :medio
	#validates_presence_of :nombre
	
	has_one :direccion, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "DireccionAyv", dependent: :destroy
	accepts_nested_attributes_for :direccion, allow_destroy: true
	
	has_one :tutor, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "TutorAyv", dependent: :destroy
	accepts_nested_attributes_for :tutor, allow_destroy: true
	
	has_many :media, -> { order("posicion ASC") }, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "MediaAyv", dependent: :destroy
	accepts_nested_attributes_for :media, allow_destroy: true
	
	has_many :media_bis, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "MediaAyv"
	
	scope :where_basico, -> { where(concurso_id: 1) }
	
	scope :dibujos, -> { select(:id, :nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, "medias.id as id1, medias.original_filename as proceso, media_bis_usuarios.id as id2, media_bis_usuarios.original_filename as terminado").left_joins(:media).where('medias.posicion = 1').left_joins(:media_bis).where('media_bis_usuarios.posicion = 2').where_basico }
	
	def age_in_completed_years (bd)
		# Difference in years, less one if you have not had a birthday this year.
		a = FECHA_TERMINO.year - bd.year
		a = a - 1 if (
		bd.month >  FECHA_TERMINO.month or
				(bd.month >= FECHA_TERMINO.month and bd.day > FECHA_TERMINO.day)
		)
		a
	end
end
