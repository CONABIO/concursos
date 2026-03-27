# == Schema Information
#
# Table name: direcciones
#
#  id         :bigint           not null, primary key
#  calle      :string(255)
#  colonia    :string(255)
#  cp         :string(255)
#  estado     :string(255)
#  interior   :string(255)
#  municipio  :string(255)
#  numero     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  usuario_id :integer          not null
#
class DireccionAyv < Direccion

    belongs_to :usuario, class_name: "UsuarioAyv"
    validates_presence_of :calle, :numero, :colonia, :municipio, :cp, :estado
    
end
