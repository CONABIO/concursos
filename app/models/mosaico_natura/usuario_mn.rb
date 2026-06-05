class MosaicoNatura::UsuarioMn < Usuario

  CONCURSO = "mn".freeze

  MEDIO = [
    ["Redes sociales", "redes-sociales"],
    ["Radio", "radio"],
    ["Televisión", "television"],
    ["En la escuela", "escuela"],
    ["Otro", "otro"]
  ]

  FECHA_NAC_MIN = Date.new(1925, 1, 1).freeze
  FECHA_NAC_MAX = Date.new(2012, 7, 6).freeze

  FECHA_ADULTOS_HASTA = Date.new(2008, 7, 5).freeze
  FECHA_JOVENES_DESDE = Date.new(2008, 7, 6).freeze
  FECHA_JOVENES_HASTA = Date.new(2012, 7, 6).freeze

  validates_presence_of(
    :nombre,
    :apellido_paterno,
    :apellido_materno,
    :fecha_nacimiento,
    :lugar_nacimiento,
    :medio
  )

  has_one :direccion,
          inverse_of: :usuario,
          foreign_key: :usuario_id,
          class_name: "DireccionMn",
          dependent: :destroy

  accepts_nested_attributes_for :direccion,
                                allow_destroy: true

  has_many :media,
           inverse_of: :usuario,
           foreign_key: :usuario_id,
           class_name: "MediaMn",
           dependent: :destroy

  accepts_nested_attributes_for :media,
                                allow_destroy: true

  validate :fecha_nacimiento_valida

  def joven?
    fecha_nacimiento.present? &&
      fecha_nacimiento.between?(FECHA_JOVENES_DESDE, FECHA_JOVENES_HASTA)
  end

  def adulto?
    fecha_nacimiento.present? &&
      fecha_nacimiento <= FECHA_ADULTOS_HASTA
  end

  private

  def fecha_nacimiento_valida
    return if fecha_nacimiento.blank?

    unless fecha_nacimiento.between?(FECHA_NAC_MIN, FECHA_NAC_MAX)
      errors.add(
        :fecha_nacimiento,
        "Debe estar entre el 01/01/1925 y el 06/07/2012."
      )
    end
  end

end