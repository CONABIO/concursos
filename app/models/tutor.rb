# == Schema Information
#
# Table name: tutores
#
#  id                :bigint           not null, primary key
#  apellido_materno  :string(255)
#  apellido_paterno  :string(255)
#  correo            :string(255)
#  nombre            :string(255)
#  telefono_contacto :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  usuario_id        :integer          not null
#
class Tutor < ApplicationRecord

	self.table_name = :tutores
	
end
