class EntreAzulYVerde::RegistroController < ApplicationController
	layout 'entre_azul_y_verde'
	before_action :set_registro, only: %i[ show edit update destroy ]
	
	# GET /usuarios or /usuarios.json
	def index
	end
	
	# GET /usuarios/1 or /usuarios/1.json
	def show
	end
	
	# GET /usuarios/new
	def new
		@registro = EntreAzulYVerde::EayvUsuario.new
	end
	
	# GET /usuarios/1/edit
	def edit
	end
	
	# POST /usuarios or /usuarios.json
	def create
		@registro = EntreAzulYVerde::EayvUsuario.new(registro_params)
		
		respond_to do |format|
			if @registro.save
				format.html { redirect_to @registro, notice: "Usuario was successfully created." }
				format.json { render :show, status: :created, location: @registro }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @registro.errors, status: :unprocessable_entity }
			end
		end
	end
	
	# PATCH/PUT /usuarios/1 or /usuarios/1.json
	def update
		respond_to do |format|
			if @registro.update(usuario_params)
				format.html { redirect_to @registro, notice: "Usuario was successfully updated." }
				format.json { render :show, status: :ok, location: @registro }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @registro.errors, status: :unprocessable_entity }
			end
		end
	end
	
	# DELETE /usuarios/1 or /usuarios/1.json
	def destroy
		@registro.destroy
		respond_to do |format|
			format.html { redirect_to usuarios_url, notice: "Usuario was successfully destroyed." }
			format.json { head :no_content }
		end
	end
	
	private
	# Use callbacks to share common setup or constraints between actions.
	def set_registro
		@registro = EntreAzulYVerde::EayvUsuario.find(params[:id])
	end
	
	# Only allow a list of trusted parameters through.
	def registro_params
		params.require(:usuario).permit(:email, :nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento_nac, :lugar_nacimiento, :curp, :password, :password_confirmation)
	end
end

