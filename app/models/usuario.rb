# == Schema Information
#
# Table name: usuarios
#
#  id               :bigint           not null, primary key
#  apellido_materno :string(255)
#  apellido_paterno :string(255)
#  fecha_nacimiento :date
#  lugar_nacimiento :string(255)
#  medio            :string(255)
#  nombre           :string(255)
#  otro_medio       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  concurso_id      :integer          not null
#  user_id          :integer          not null
#
class Usuario < ApplicationRecord
 
	belongs_to :user
	
end
