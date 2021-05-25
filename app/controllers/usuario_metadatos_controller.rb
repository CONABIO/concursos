class UsuarioMetadatosController < ApplicationController
  before_action :set_usuario_metadato, only: %i[ show edit update destroy ]

  # GET /usuario_metadatos or /usuario_metadatos.json
  def index
    @usuario_metadatos = UsuarioMetadato.all
  end

  # GET /usuario_metadatos/1 or /usuario_metadatos/1.json
  def show
  end

  # GET /usuario_metadatos/new
  def new
    @usuario_metadato = UsuarioMetadato.new
  end

  # GET /usuario_metadatos/1/edit
  def edit
  end

  # POST /usuario_metadatos or /usuario_metadatos.json
  def create
    @usuario_metadato = UsuarioMetadato.new(usuario_metadato_params)

    respond_to do |format|
      if @usuario_metadato.save
        format.html { redirect_to @usuario_metadato, notice: "Usuario metadato was successfully created." }
        format.json { render :show, status: :created, location: @usuario_metadato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usuario_metadato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuario_metadatos/1 or /usuario_metadatos/1.json
  def update
    respond_to do |format|
      if @usuario_metadato.update(usuario_metadato_params)
        format.html { redirect_to @usuario_metadato, notice: "Usuario metadato was successfully updated." }
        format.json { render :show, status: :ok, location: @usuario_metadato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usuario_metadato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario_metadatos/1 or /usuario_metadatos/1.json
  def destroy
    @usuario_metadato.destroy
    respond_to do |format|
      format.html { redirect_to usuario_metadatos_url, notice: "Usuario metadato was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_metadato
      @usuario_metadato = UsuarioMetadato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_metadato_params
      params.require(:usuario_metadato).permit(:id_metadato, :id_usuario, :valor_metadato)
    end
end
