class UsuarioMn < Usuario

    CONCURSO = "mn".freeze
    MEDIO = [["Redes sociales", "redes-sociales"], ["Radio", "radio"], ["Televisión", "television"], ["En la escuela", "escuela"], ["Otro", "otro"]]
    FECHA_NAC_MIN = "2003-01-01"
    FECHA_NAC_MAX = "2016-01-01"

    validates_presence_of :nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :lugar_nacimiento, :medio
    #validates_presence_of :nombre

    has_one :direccion, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "DireccionMn", dependent: :destroy
    accepts_nested_attributes_for :direccion, allow_destroy: true

    has_one :tutor, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "TutorMn", dependent: :destroy
    accepts_nested_attributes_for :tutor, allow_destroy: true 

    has_many :media, -> { order("posicion ASC") }, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "MediaMn", dependent: :destroy
    accepts_nested_attributes_for :media, allow_destroy: true 
       
end
