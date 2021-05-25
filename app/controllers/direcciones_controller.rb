class DireccionesController < ApplicationController
  before_action :set_direccion, only: %i[ show edit update destroy ]

  # GET /direcciones or /direcciones.json
  def index
    @direcciones = Direccion.all
  end

  # GET /direcciones/1 or /direcciones/1.json
  def show
  end

  # GET /direcciones/new
  def new
    @direccion = Direccion.new
  end

  # GET /direcciones/1/edit
  def edit
  end

  # POST /direcciones or /direcciones.json
  def create
    @direccion = Direccion.new(direccion_params)

    respond_to do |format|
      if @direccion.save
        format.html { redirect_to @direccion, notice: "Direccion was successfully created." }
        format.json { render :show, status: :created, location: @direccion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @direccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /direcciones/1 or /direcciones/1.json
  def update
    respond_to do |format|
      if @direccion.update(direccion_params)
        format.html { redirect_to @direccion, notice: "Direccion was successfully updated." }
        format.json { render :show, status: :ok, location: @direccion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @direccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /direcciones/1 or /direcciones/1.json
  def destroy
    @direccion.destroy
    respond_to do |format|
      format.html { redirect_to direcciones_url, notice: "Direccion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direccion
      @direccion = Direccion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def direccion_params
      params.require(:direccion).permit(:calle, :numero, :interior, :colonia, :municipio, :cp, :estado, :id_usuario)
    end
end
