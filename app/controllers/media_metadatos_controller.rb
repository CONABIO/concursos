class MediaMetadatosController < ApplicationController
  before_action :set_media_metadato, only: %i[ show edit update destroy ]

  # GET /media_metadatos or /media_metadatos.json
  def index
    @media_metadatos = MediaMetadato.all
  end

  # GET /media_metadatos/1 or /media_metadatos/1.json
  def show
  end

  # GET /media_metadatos/new
  def new
    @media_metadato = MediaMetadato.new
  end

  # GET /media_metadatos/1/edit
  def edit
  end

  # POST /media_metadatos or /media_metadatos.json
  def create
    @media_metadato = MediaMetadato.new(media_metadato_params)

    respond_to do |format|
      if @media_metadato.save
        format.html { redirect_to @media_metadato, notice: "Media metadato was successfully created." }
        format.json { render :show, status: :created, location: @media_metadato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @media_metadato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_metadatos/1 or /media_metadatos/1.json
  def update
    respond_to do |format|
      if @media_metadato.update(media_metadato_params)
        format.html { redirect_to @media_metadato, notice: "Media metadato was successfully updated." }
        format.json { render :show, status: :ok, location: @media_metadato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @media_metadato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_metadatos/1 or /media_metadatos/1.json
  def destroy
    @media_metadato.destroy
    respond_to do |format|
      format.html { redirect_to media_metadatos_url, notice: "Media metadato was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_metadato
      @media_metadato = MediaMetadato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def media_metadato_params
      params.require(:media_metadato).permit(:id_metadato, :id_media, :valor_metadato)
    end
end
