class UsuarioMetadato < ApplicationRecord
	
	belongs_to :usuario
	belongs_to :cat_metadato
	
end
