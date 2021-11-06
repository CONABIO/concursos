class TutorAyv < Tutor

    belongs_to :usuario, class_name: "UsuarioAyv"
    validates_presence_of :nombre, :apellido_paterno, :apellido_materno
    
end
