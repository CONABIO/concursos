# == Schema Information
#
# Table name: media_metadatos
#
#  id          :bigint           not null, primary key
#  compromiso  :text(65535)
#  descripcion :text(65535)
#  localidad   :string(255)
#  marca       :string(255)
#  otra_marca  :string(255)
#  tecnica     :text(65535)
#  titulo      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  media_id    :integer          not null
#
class MosaicoNatura::MediaMetadatoMn < MediaMetadato
	
	MARCA = [['Canon','canon'],['Nikon','nikon'],['Olympus','olympus'],['Sony','sony'],['Fuji','fuji'],['Panasonic','panasonic'],['Otro','otro']]
	
	belongs_to :media, class_name: "MediaMn"
	validates_presence_of :titulo, :descripcion, :marca, :localidad

end
