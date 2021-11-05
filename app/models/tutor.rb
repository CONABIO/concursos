class Tutor < ApplicationRecord

	self.table_name = :tutores
	belongs_to :usuario
	
end
