class UsuarioMetadato < ApplicationRecord
	
	belongs_to :usuario
	belongs_to :cat_metadato, foreign_key: :metadato_id
	
end
