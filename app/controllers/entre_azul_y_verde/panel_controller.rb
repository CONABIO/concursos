class EntreAzulYVerde::PanelController < EntreAzulYVerde::EntreAzulYVerdeController
  before_action :authenticate, only: %i[ precalificacion calificacion ]

	def precalificacion
		@dibujos = {}
		@dibujos[:de_6_a_8] = UsuarioAyv.de_6_a_8
		@dibujos[:de_9_a_11] = UsuarioAyv.de_9_a_11
		@dibujos[:de_12_a_14] = UsuarioAyv.de_12_a_14
		@dibujos[:de_15_a_17] = UsuarioAyv.de_15_a_17
		@dibujos[:menores_a_6] = UsuarioAyv.menores_a_6
		@dibujos[:mayores_a_17] = UsuarioAyv.mayores_a_17
	end

	def calificacion
	
	end
	
end
