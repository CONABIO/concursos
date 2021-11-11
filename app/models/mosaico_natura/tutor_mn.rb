class TutorMn < Tutor

    belongs_to :usuario, class_name: "UsuarioMn"
    validates_presence_of :nombre, :apellido_paterno, :apellido_materno
    
end
