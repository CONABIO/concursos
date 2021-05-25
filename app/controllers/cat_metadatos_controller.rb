class CatMetadatosController < ApplicationController
  before_action :set_cat_metadato, only: %i[ show edit update destroy ]

  # GET /cat_metadatos or /cat_metadatos.json
  def index
    @cat_metadatos = CatMetadato.all
  end

  # GET /cat_metadatos/1 or /cat_metadatos/1.json
  def show
  end

  # GET /cat_metadatos/new
  def new
    @cat_metadato = CatMetadato.new
  end

  # GET /cat_metadatos/1/edit
  def edit
  end

  # POST /cat_metadatos or /cat_metadatos.json
  def create
    @cat_metadato = CatMetadato.new(cat_metadato_params)

    respond_to do |format|
      if @cat_metadato.save
        format.html { redirect_to @cat_metadato, notice: "Cat metadato was successfully created." }
        format.json { render :show, status: :created, location: @cat_metadato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cat_metadato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cat_metadatos/1 or /cat_metadatos/1.json
  def update
    respond_to do |format|
      if @cat_metadato.update(cat_metadato_params)
        format.html { redirect_to @cat_metadato, notice: "Cat metadato was successfully updated." }
        format.json { render :show, status: :ok, location: @cat_metadato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cat_metadato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_metadatos/1 or /cat_metadatos/1.json
  def destroy
    @cat_metadato.destroy
    respond_to do |format|
      format.html { redirect_to cat_metadatos_url, notice: "Cat metadato was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat_metadato
      @cat_metadato = CatMetadato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cat_metadato_params
      params.require(:cat_metadato).permit(:nombre_metadato, :descripcion, :ancestry)
    end
end
