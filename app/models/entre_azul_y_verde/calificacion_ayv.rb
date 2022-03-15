Class CalificacionAyv < Calificacion

    belongs_to :usuario, class_name: "MediaAyv"
    validates_presence_of :calificacion, :media_id

end