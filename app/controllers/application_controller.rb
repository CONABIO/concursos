class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
	protected
	
	# Limita la aplicacion a un usuario y contrasenia general
	def authenticate
		@juez = nil
		authorized = false
		authenticate_or_request_with_http_basic do |username, password|
			Rails.application.secrets.entre_azul_y_verde.each do |k,v|
				authorized = (v[:usuario] == username && v[:password] == password)
				@juez = v[:posicion] if authorized
				return if authorized
			end
			Rails.application.secrets.mosaico_natura.each do |k,v|
				authorized = (v[:usuario] == username && v[:password] == password)
				@juez = v[:posicion] if authorized
				return if authorized
			end
			authorized
		end
	end
end
