# == Schema Information
#
# Table name: usuarios
#
#  id               :bigint           not null, primary key
#  apellido_materno :string(255)
#  apellido_paterno :string(255)
#  fecha_nacimiento :date
#  lugar_nacimiento :string(255)
#  medio            :string(255)
#  nombre           :string(255)
#  otro_medio       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  concurso_id      :integer          not null
#  user_id          :integer          not null
#
class MosaicoNatura::UsuarioMn < Usuario

    CONCURSO = "mn".freeze
    MEDIO = [["Redes sociales", "redes-sociales"], ["Radio", "radio"], ["Televisión", "television"], ["En la escuela", "escuela"], ["Otro", "otro"]]
    FECHA_NAC_MIN = "2022-16-01"
    FECHA_NAC_MIN_ADULTOS = Date.new(2004, 01, 16)
    FECHA_NAC_MAX = "1904-16-01"

    validates_presence_of :nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :lugar_nacimiento, :medio
    #validates_presence_of :nombre

    has_one :direccion, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "DireccionMn", dependent: :destroy
    accepts_nested_attributes_for :direccion, allow_destroy: true

    has_many :media, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "MediaMn", dependent: :destroy
    accepts_nested_attributes_for :media, allow_destroy: true 
       
end
