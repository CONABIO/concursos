class EntreAzulYVerde::RegistroController < EntreAzulYVerde::EntreAzulYVerdeController
	before_action :set_registro, only: %i[ show edit update destroy ]
	before_action :authenticate_user_ayv!
	
	# GET /registro/new
	def new
		@registro = UsuarioAyv.where(user_id: current_user_ayv.id).first

		if @registro.present?
			redirect_to edit_entre_azul_y_verde_registro_path(@registro)
		else  # Es nuevo usuario
			@form_params = { url: '/entre_azul_y_verde/registro', method: 'post' }
			@registro = UsuarioAyv.new
			@registro.build_direccion
			@registro.build_tutor
			@registro.media.build(posicion: 1)
			@registro.media.build(posicion: 2)
		end
	end
	
	# GET /registro/1/edit
	def edit
		@form_params = { url: entre_azul_y_verde_registro_path(@registro), method: 'put' }
	end
	
	# POST /registro or /registro.json
	def create
		@registro = UsuarioAyv.new(registro_params)

		# Asigna le concurso
		concurso = CatConcurso.where(nombre_concurso: UsuarioAyv::CONCURSO).first
		@registro.concurso_id = concurso.id
		
		respond_to do |format|
			if @registro.save
				format.html { redirect_to edit_entre_azul_y_verde_registro_path(@registro), notice: "Tu registro fue creado exitosamente." }
				format.json { render :show, status: :created, location: @registro }
			else
				Rails.logger.info @registro.errors.inspect
				@form_params = { url: '/entre_azul_y_verde/registro', method: 'post' }
				format.html { render :new, locals: { notice: "Hubo un problema al guardar tus datos. Por favor verifica los campos en rojo"} }
				format.json { render json: @registro.errors, status: :unprocessable_entity }
			end
		end
	end
	
	# PATCH/PUT /registro/1 or /registro/1.json
	def update
		respond_to do |format|
			if @registro.update(registro_params)
				@form_params = { url: entre_azul_y_verde_registro_path(@registro), method: 'put' }
				format.html { redirect_to edit_entre_azul_y_verde_registro_path(@registro), notice: "Tu registro fue actualizado exitosamente." }
				format.json { render :show, status: :ok, location: @registro }
			else
				@form_params = { url: entre_azul_y_verde_registro_path(@registro), method: 'put' }
				format.html { render :edit, locals: { notice: "Hubo un problema al guardar tus datos. Por favor verifica los campos en rojo"} }
				format.json { render json: @registro.errors, status: :unprocessable_entity }
			end
		end
	end

	
	private
	# Use callbacks to share common setup or constraints between actions.
	def set_registro
		@registro = UsuarioAyv.find(params[:id])
	end
	
	# Only allow a list of trusted parameters through.
	def registro_params
			params.require(:usuario_ayv).permit(:nombre, :apellido_paterno, :apellido_materno, :fecha_nacimiento, :lugar_nacimiento, :medio, :otro_medio, :user_id,
											tutor_attributes: [:id, :nombre, :apellido_paterno, :apellido_materno, :telefono_contacto, :usuario_id, :_destroy],
			                                direccion_attributes: [:id, :calle, :numero, :interior, :colonia, :municipio, :cp, :estado, :usuario_id, :_destroy],
			                                media_attributes: [:id, :original_filename, :posicion, :filename, :titulo, :fecha_subida, :ruta, :size, :usuario_id, :categoria_id, :_destroy],
			)
	end
end

