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
	
	scope :menores_a_6, -> { dibujos.where("usuarios.fecha_nacimiento > \"#{Date.new(2016,2,28)}\"") }
	
	scope :de_6_a_8, -> { dibujos.where("usuarios.fecha_nacimiento < \"#{Date.new(2016,3,1)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2013,3,1)}\"") }
	
	scope :de_9_a_11, -> { dibujos.where("usuarios.fecha_nacimiento < \"#{Date.new(2013,2,28)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2010,3,1)}\"") }
	
	scope :de_12_a_14, -> { dibujos.where("usuarios.fecha_nacimiento < \"#{Date.new(2010,2,28)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2007,3,1)}\"") }
	
	scope :de_15_a_17, -> { dibujos.where("usuarios.fecha_nacimiento < \"#{Date.new(2007,2,28)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2004,2,28)}\"") }
	
	scope :mayores_a_17, -> { dibujos.where("usuarios.fecha_nacimiento < \"#{Date.new(2004,3,1)}\"") }
	
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
