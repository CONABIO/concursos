class Media < ApplicationRecord
	
	def genera_filename_anonimo
		[self.usuario_id, self.categoria_id, self.id, self.created_at.strftime('%Y%m%d%H%M%S'),self.dame_extension].join('_')
	end
	
	def dame_extension
		"." << self.original_filename.split(".")[-1].to_s.downcase.gsub('e','')
	end

end
