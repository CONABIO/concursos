class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  # Limita la aplicacion a un usuario y contrasenia general
  def authenticate
	  @juez = nil
	  authenticate_or_request_with_http_basic do |username, password|
		  case username
			  when Rails.application.secrets.dgcc
				  password == Rails.application.secrets.password_dgcc
			  when Rails.application.secrets.juez0
				  @juez = 0
				  password == Rails.application.secrets.password_juez0
			  when Rails.application.secrets.juez1
				  @juez = 1
				  password == Rails.application.secrets.password_juez1
			  when Rails.application.secrets.juez2
				  @juez = 2
				  password == Rails.application.secrets.password_juez2
			  else
				  false
		  end
	  end
  end

end
