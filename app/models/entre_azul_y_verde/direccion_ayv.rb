class DireccionAyv < Direccion

    belongs_to :usuario, class_name: "UsuarioAyv"
    validates_presence_of :calle, :numero, :colonia, :municipio, :cp, :estado
    
end
