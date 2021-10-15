class Direccion < ApplicationRecord

	belongs_to :usuario, foreign_key: :usuario_id

end
