class Media < ApplicationRecord
	
	has_one :media_metadato
	has_one :categoria
	belongs_to :usuario, foreign_key: :usuario_id
	
end
