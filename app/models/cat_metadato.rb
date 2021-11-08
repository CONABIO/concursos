class CatMetadato < ApplicationRecord
	
	has_many :media_metadatos, foreign_key: :metadato_id
	has_many :usuario_metadatos, foreign_key: :metadato_id
	
end
