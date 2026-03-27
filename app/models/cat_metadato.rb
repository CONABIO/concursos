# == Schema Information
#
# Table name: cat_metadatos
#
#  id              :bigint           not null, primary key
#  ancestry        :string(255)
#  descripcion     :string(255)
#  nombre_metadato :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class CatMetadato < ApplicationRecord
	
	has_many :media_metadatos, foreign_key: :metadato_id
	has_many :usuario_metadatos, foreign_key: :metadato_id
	
end
