# == Schema Information
#
# Table name: usuario_metadatos
#
#  id             :bigint           not null, primary key
#  valor_metadato :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  metadato_id    :integer
#  usuario_id     :integer
#
class UsuarioMetadato < ApplicationRecord
	
	belongs_to :usuario
	belongs_to :cat_metadato, foreign_key: :metadato_id
	
end
