class MosaicoNatura::MosaicoNaturaController < ApplicationController
	layout 'mosaico_natura'
	
	protected
	
	# Limita la aplicacion a un usuario y contrasenia general
	def authenticate
		@juez = nil
		authenticate_or_request_with_http_basic do |username, password|
			case username
				when Rails.application.secrets.mn
					@juez = 3
					password == Rails.application.secrets.password_dgcc
				when Rails.application.secrets.juez0
					@juez = 0
					password == Rails.application.secrets.password_juez_foto_0
				when Rails.application.secrets.juez1
					@juez = 1
					password == Rails.application.secrets.password_juez_foto_1
				when Rails.application.secrets.juez2
					@juez = 2
					password == Rails.application.secrets.password_juez_foto_2
				when Rails.application.secrets.juez3
					@juez = 3
					password == Rails.application.secrets.password_juez_video_0
				when Rails.application.secrets.juez4
					@juez = 4
					password == Rails.application.secrets.password_juez_video_1
				else
					false
			end
		end
	end
end