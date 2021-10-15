class Usuario < ApplicationRecord
 
	#has_secure_password
	has_one :direccion, inverse_of: :usuario
	accepts_nested_attributes_for :direccion, allow_destroy: true
	
	has_many :medias, inverse_of: :usuario, foreign_key: :usuario_id
	accepts_nested_attributes_for :medias, allow_destroy: true
	
	has_many :usuario_metadatos , inverse_of: :usuario
	accepts_nested_attributes_for :usuario_metadatos, allow_destroy: true
	
end
