# == Schema Information
#
# Table name: medias
#
#  id                :bigint           not null, primary key
#  fecha_subida      :date
#  filename          :string(255)
#  original_filename :string(255)
#  posicion          :integer
#  ruta              :string(255)
#  size              :integer
#  titulo            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  categoria_id      :integer
#  usuario_id        :integer
#
class Media < ApplicationRecord
	
	def genera_filename_anonimo
		[self.usuario_id, self.categoria_id, self.id, self.created_at.strftime('%Y%m%d%H%M%S'),dame_extension(self.original_filename)].join('_')
	end
	
	def dame_extension(filename)
		"." << filename.split(".")[-1].to_s.downcase.gsub('e','')
	end

end
