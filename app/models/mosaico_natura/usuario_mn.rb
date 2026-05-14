class MosaicoNatura::UsuarioMn < Usuario

    CONCURSO = "mn".freeze
    MEDIO = [["Redes sociales", "redes-sociales"], ["Radio", "radio"], ["Televisión", "television"], ["En la escuela", "escuela"], ["Otro", "otro"]]
    
    # Edad mínima de 14 años
    EDAD_MINIMA = 14
    
    def self.fecha_nac_min_adultos
        Date.today - EDAD_MINIMA.years
    end
    
    # Nota: Corregir formato de FECHA_NAC_MIN (está mal escrito "2009-16-01", debería ser "2009-01-16")
    FECHA_NAC_MIN = "2009-01-16"  # Para menores de 14 años? Ajusta según necesites
    FECHA_NAC_MAX = "1904-01-16"

    validates_presence_of :nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :lugar_nacimiento, :medio

    has_one :direccion, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "DireccionMn", dependent: :destroy
    accepts_nested_attributes_for :direccion, allow_destroy: true

    has_many :media, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "MediaMn", dependent: :destroy
    accepts_nested_attributes_for :media, allow_destroy: true 
    
    # Opcional: Validación personalizada para edad mínima
    validate :edad_minima_cumplida
    
    private
    
    def edad_minima_cumplida
        return if fecha_nacimiento.blank?
        
        edad = Date.today.year - fecha_nacimiento.year
        edad -= 1 if Date.today < fecha_nacimiento + edad.years
        
        if edad < EDAD_MINIMA
            errors.add(:fecha_nacimiento, "Debes tener al menos #{EDAD_MINIMA} años")
        end
    end
end