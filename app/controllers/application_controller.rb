class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  # Limita la aplicacion a un usuario y contrasenia general
  def authenticate
	  authenticate_or_request_with_http_basic do |username, password|
		  username == Rails.application.secrets.usuario_calificacion && password == Rails.application.secrets.password_calificacion
	  end
  end

end
