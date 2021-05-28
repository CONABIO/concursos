class Usuario < ApplicationRecord
 
	has_secure_password
	has_one :direccion
	has_many :media
	has_many :usuario_metadatos
	
	
end
