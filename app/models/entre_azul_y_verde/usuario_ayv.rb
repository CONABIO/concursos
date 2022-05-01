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
	
	has_many :media_metadato, through: :media_bis, source: :media_metadato

	has_many :calificaciones, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "CalificacionAyv"
	
	scope :where_basico, -> { where(concurso_id: 1) }
	
	scope :select_dibujo, -> { select(:id, :nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, "medias.id as media1_id", "medias.original_filename as proceso", "media_bis_usuarios_join.id as media2_id", "media_bis_usuarios_join.original_filename as terminado", "media_metadatos.titulo", :descripcion, :tecnica, :compromiso, :calificacion) }
	scope :select_promedio, -> { select("(substr(cast(calificacion as char),1,1) + substr(cast(calificacion as char),2,1) + substr(cast(calificacion as char),3,1))/3 as promedio") }
	scope :select_lugar, -> { select("(substr(cast(calificacion as char),4,1)) as lugar") }

	scope :joins_dibujos, -> { left_joins(:media, :media_metadato, :calificaciones) }
	
	scope :where_dibujos, -> { where('medias.posicion = 1').where('media_bis_usuarios_join.posicion = 2').where_basico }
	
	# All los dibujos, por eso el left join
	scope :dibujos, -> { select_dibujo.joins_dibujos.where_dibujos.order('usuarios.id ASC') }
	# Solo los finalistas, por eso el inner join
	scope :dibujos_finalistas, -> { select_dibujo.left_joins(:media, :media_metadato).joins(:calificaciones).where_dibujos.order('usuarios.id ASC') }
	# Sólo los q se tienen q desempatar
	scope :dibujos_desempate, -> { select_dibujo.left_joins(:media, :media_metadato).joins(:calificaciones).select_promedio.where_dibujos.order('promedio DESC').limit(6) }
	# Los elegidos por los dioses... (del dibujo :P)
	scope :dibujos_ganadores, -> { select_dibujo.left_joins(:media, :media_metadato).joins(:calificaciones).select_lugar.where_dibujos.where("calificacion not like '%0'").order('lugar ASC') }

	scope :menores_a_6, -> { where("usuarios.fecha_nacimiento > \"#{Date.new(2016,2,28)}\"") }
	scope :de_6_a_8, -> { where("usuarios.fecha_nacimiento <= \"#{Date.new(2016,2,28)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2013,2,28)}\"") }
	#Para fusionar ambas categorias
	scope :menores_a_9, -> { where("usuarios.fecha_nacimiento > \"#{Date.new(2013,2,28)}\"") }

	scope :de_9_a_11, -> { where("usuarios.fecha_nacimiento <= \"#{Date.new(2013,2,28)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2010,2,28)}\"") }
	
	scope :de_12_a_14, -> { where("usuarios.fecha_nacimiento <= \"#{Date.new(2010,2,28)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2007,2,28)}\"") }
	
	scope :de_15_a_17, -> { where("usuarios.fecha_nacimiento <= \"#{Date.new(2007,2,28)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2004,2,28)}\"") }
	scope :mayores_a_17, -> { where("usuarios.fecha_nacimiento <= \"#{Date.new(2004,2,28)}\"") }
	#Para fusionar ambas categorias
	scope :mayores_a_14, -> { where("usuarios.fecha_nacimiento <= \"#{Date.new(2007,2,28)}\"") }
	
	
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
