class MosaicoNatura::GaleriasController < MosaicoNatura::MosaicoNaturaController
	
	before_action :set_mosaico_natura_galeria, only: %i[ show edit update destroy ]

  # GET /mosaico_natura/galerias or /mosaico_natura/galerias.json
  def index
    @mosaico_natura_galerias = MosaicoNatura::Galeria.todos
  end

  # GET /mosaico_natura/galerias/1 or /mosaico_natura/galerias/1.json
  def show
  end

  # GET /mosaico_natura/galerias/new
  def new
    @mosaico_natura_galeria = MosaicoNatura::Galeria.new
  end

  # GET /mosaico_natura/galerias/1/edit
  def edit
  end

  # POST /mosaico_natura/galerias or /mosaico_natura/galerias.json
  def create
    @mosaico_natura_galeria = MosaicoNatura::Galeria.new(mosaico_natura_galeria_params)

    respond_to do |format|
      if @mosaico_natura_galeria.save
        format.html { redirect_to @mosaico_natura_galeria, notice: "Galeria was successfully created." }
        format.json { render :show, status: :created, location: @mosaico_natura_galeria }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mosaico_natura_galeria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mosaico_natura/galerias/1 or /mosaico_natura/galerias/1.json
  def update
    respond_to do |format|
      if @mosaico_natura_galeria.update(mosaico_natura_galeria_params)
        format.html { redirect_to @mosaico_natura_galeria, notice: "Galeria was successfully updated." }
        format.json { render :show, status: :ok, location: @mosaico_natura_galeria }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mosaico_natura_galeria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosaico_natura/galerias/1 or /mosaico_natura/galerias/1.json
  def destroy
    @mosaico_natura_galeria.destroy
    respond_to do |format|
      format.html { redirect_to mosaico_natura_galerias_url, notice: "Galeria was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mosaico_natura_galeria
      @mosaico_natura_galeria = MosaicoNatura::Galeria.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mosaico_natura_galeria_params
      params.fetch(:mosaico_natura_galeria, {})
    end
end
