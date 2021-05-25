class CatConcursosController < ApplicationController
  before_action :set_cat_concurso, only: %i[ show edit update destroy ]

  # GET /cat_concursos or /cat_concursos.json
  def index
    @cat_concursos = CatConcurso.all
  end

  # GET /cat_concursos/1 or /cat_concursos/1.json
  def show
  end

  # GET /cat_concursos/new
  def new
    @cat_concurso = CatConcurso.new
  end

  # GET /cat_concursos/1/edit
  def edit
  end

  # POST /cat_concursos or /cat_concursos.json
  def create
    @cat_concurso = CatConcurso.new(cat_concurso_params)

    respond_to do |format|
      if @cat_concurso.save
        format.html { redirect_to @cat_concurso, notice: "Cat concurso was successfully created." }
        format.json { render :show, status: :created, location: @cat_concurso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cat_concurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cat_concursos/1 or /cat_concursos/1.json
  def update
    respond_to do |format|
      if @cat_concurso.update(cat_concurso_params)
        format.html { redirect_to @cat_concurso, notice: "Cat concurso was successfully updated." }
        format.json { render :show, status: :ok, location: @cat_concurso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cat_concurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_concursos/1 or /cat_concursos/1.json
  def destroy
    @cat_concurso.destroy
    respond_to do |format|
      format.html { redirect_to cat_concursos_url, notice: "Cat concurso was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat_concurso
      @cat_concurso = CatConcurso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cat_concurso_params
      params.require(:cat_concurso).permit(:nombre_concurso, :descripcion_concurso)
    end
end
