class EntreAzulYVerde::InicioController < ApplicationController
	layout 'entre_azul_y_verde'

	def index
	end

	def bases
		render partial: 'bases'
	end
	
end
