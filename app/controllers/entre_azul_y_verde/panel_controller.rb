class EntreAzulYVerde::PanelController < EntreAzulYVerde::EntreAzulYVerdeController

	def precalificacion
		
		@dibujos_menores = UsuarioAyv.dibujos.where("usuarios.fecha_nacimiento > \"#{Date.new(2016,2,28)}\"")
		@dibujos_6_8 = UsuarioAyv.dibujos.where("usuarios.fecha_nacimiento < \"#{Date.new(2016,3,1)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2013,3,1)}\"")
		@dibujos_9_11 = UsuarioAyv.dibujos.where("usuarios.fecha_nacimiento < \"#{Date.new(2013,2,28)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2010,3,1)}\"")
		@dibujos_12_14 = UsuarioAyv.dibujos.where("usuarios.fecha_nacimiento < \"#{Date.new(2010,2,28)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2007,3,1)}\"")
		@dibujos_15_17 = UsuarioAyv.dibujos.where("usuarios.fecha_nacimiento < \"#{Date.new(2007,2,28)}\" and usuarios.fecha_nacimiento > \"#{Date.new(2004,2,28)}\"")
		@dibujos_mayores = UsuarioAyv.dibujos.where("usuarios.fecha_nacimiento < \"#{Date.new(2004,3,1)}\"")

	end

	def calificacion
	
	end
	
end
