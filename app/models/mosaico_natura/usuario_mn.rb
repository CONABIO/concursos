class MosaicoNatura::UsuarioMn < Usuario

    CONCURSO = "mn".freeze
    MEDIO = [["Redes sociales", "redes-sociales"], ["Radio", "radio"], ["Televisión", "television"], ["En la escuela", "escuela"], ["Otro", "otro"]]
    
    # Edad mínima de 14 años
    EDAD_MINIMA = 14
    
    def self.fecha_nac_min_adultos
        Date.today - EDAD_MINIMA.years
    end
    
    # Fecha mínima (dinámica: hoy - 14 años)
    FECHA_NAC_MIN = fecha_nac_min_adultos.freeze
    
    # Fecha límite: nacidos en 2012 o antes (14 años cumplidos en 2026)
    # Ejemplo: si hoy es 2026, FECHA_NAC_MAX_LIMITE = 2012-12-31 (los de 2012 aún entran)
    FECHA_NAC_MAX_LIMITE = Date.new(2012, 12, 31).freeze

    validates_presence_of :nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :lugar_nacimiento, :medio

    has_one :direccion, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "DireccionMn", dependent: :destroy
    accepts_nested_attributes_for :direccion, allow_destroy: true

    has_many :media, inverse_of: :usuario, foreign_key: :usuario_id, class_name: "MediaMn", dependent: :destroy
    accepts_nested_attributes_for :media, allow_destroy: true 
    
    # Validación personalizada para edad mínima (nacimiento hasta 2012 inclusive)
    validate :fecha_nacimiento_valida
    
    private
    
    def fecha_nacimiento_valida
        return if fecha_nacimiento.blank?
        
        # Calcular edad exacta
        hoy = Date.today
        edad = hoy.year - fecha_nacimiento.year
        edad -= 1 if hoy < fecha_nacimiento + edad.years
        
        if edad < EDAD_MINIMA
            errors.add(:fecha_nacimiento, "Debes tener al menos #{EDAD_MINIMA} años. Solo personas nacidas en #{hoy.year - EDAD_MINIMA} o antes pueden registrarse.")
        end
    end
end