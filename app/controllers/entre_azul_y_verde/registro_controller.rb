class EntreAzulYVerde::RegistroController < EntreAzulYVerde::EntreAzulYVerdeController
	before_action :set_registro, only: %i[ show edit update destroy ]
	before_action :authenticate_user_ayv!
	
	# GET /usuarios or /usuarios.json
	def index
	end
	
	# GET /usuarios/1 or /usuarios/1.json
	def show
	end
	
	# GET /usuarios/new
	def new
		@registro = Usuario.new
		@registro.build_direccion #unless @registro.direccion.any?
		@registro.medias.build
	end
	
	# GET /usuarios/1/edit
	def edit
	end
	
	# POST /usuarios or /usuarios.json
	def create
		@registro = Usuario.new(registro_params)
		
		respond_to do |format|
			if @registro.save
				format.html { render :show, notice: "Usuario was successfully created.1" }
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
		@registro = Usuario.find(params[:id])
	end
	
	# Only allow a list of trusted parameters through.
	def registro_params
			params.require(:usuario).permit(:nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :lugar_nacimiento, :user_id,
			                                direccion_attributes: [:id, :calle, :numero, :interior, :colonia, :municipio, :cp, :estado, :usuario_id, :_destroy],
			                                medias_attributes: [:id, :original_filename, :filename, :titulo, :fecha_subida, :ruta, :size, :usuario_id, :categoria_id, :_destroy],
			                                usuario_metadatos_attributes: [:id, :id_metadato, :id_usuario, :valor_metadato, :_destroy]
			)
	end
end

