class EntreAzulYVerde::GaleriasController < EntreAzulYVerde::EntreAzulYVerdeController
	
	before_action :set_entre_azul_y_verde_galeria, only: %i[ show edit update destroy ]

  # GET /entre_azul_y_verde/galerias or /entre_azul_y_verde/galerias.json
  def index
    @entre_azul_y_verde_galerias = EntreAzulYVerde::Galeria.todos
  end

  # GET /entre_azul_y_verde/galerias/1 or /entre_azul_y_verde/galerias/1.json
  def show
  end

  # GET /entre_azul_y_verde/galerias/new
  def new
    @entre_azul_y_verde_galeria = EntreAzulYVerde::Galeria.new
  end

  # GET /entre_azul_y_verde/galerias/1/edit
  def edit
  end

  # POST /entre_azul_y_verde/galerias or /entre_azul_y_verde/galerias.json
  def create
    @entre_azul_y_verde_galeria = EntreAzulYVerde::Galeria.new(entre_azul_y_verde_galeria_params)

    respond_to do |format|
      if @entre_azul_y_verde_galeria.save
        format.html { redirect_to @entre_azul_y_verde_galeria, notice: "Galeria was successfully created." }
        format.json { render :show, status: :created, location: @entre_azul_y_verde_galeria }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entre_azul_y_verde_galeria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entre_azul_y_verde/galerias/1 or /entre_azul_y_verde/galerias/1.json
  def update
    respond_to do |format|
      if @entre_azul_y_verde_galeria.update(entre_azul_y_verde_galeria_params)
        format.html { redirect_to @entre_azul_y_verde_galeria, notice: "Galeria was successfully updated." }
        format.json { render :show, status: :ok, location: @entre_azul_y_verde_galeria }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entre_azul_y_verde_galeria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entre_azul_y_verde/galerias/1 or /entre_azul_y_verde/galerias/1.json
  def destroy
    @entre_azul_y_verde_galeria.destroy
    respond_to do |format|
      format.html { redirect_to entre_azul_y_verde_galerias_url, notice: "Galeria was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entre_azul_y_verde_galeria
      @entre_azul_y_verde_galeria = EntreAzulYVerde::Galeria.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entre_azul_y_verde_galeria_params
      params.fetch(:entre_azul_y_verde_galeria, {})
    end
end
