class MosaicoNatura::SelectorController < MosaicoNatura::MosaicoNaturaController
  before_action :verificar_selector!

def reporte
  @medias = MosaicoNatura::MediaMn
              .joins(:usuario)
              .includes(:usuario, :categoria, :media_metadato)
              .where("medias.created_at >= ?", Date.current.beginning_of_year)
              .where.not(foto: [nil, ''])
              .where.not(descripcion: [nil, ''])
              .order(:categoria_id, :usuario_id)

  respond_to do |format|
    format.xlsx do
      response.headers['Content-Disposition'] =
        'attachment; filename="reporte_participantes.xlsx"'
      render layout: false
    end
  end
end

  def index
    @foto = MosaicoNatura::MediaMn
              .where_fotos
              .pending_selection
              .includes(:categoria)
              .order(:categoria_id, :id)
              .first

    @total = MosaicoNatura::MediaMn.where_fotos.count
    @revisadas = MosaicoNatura::MediaMn.where_fotos.reviewed.count
    @seleccionadas = MosaicoNatura::MediaMn.where_fotos.selected.count
    @descartadas = MosaicoNatura::MediaMn.where_fotos.discarded.count
  end

  def update
    @foto = MosaicoNatura::MediaMn.find(params[:id])

    @foto.update(
      reviewed: true,
      selected: ActiveModel::Type::Boolean.new.cast(params[:selected])
    )

    redirect_to mosaico_natura_selector_index_path
  end

  def gallery
    @categorias = MosaicoNatura::CategoriaMn.order(:nombre_categoria)

    @categoria_id = params[:categoria_id]
    @estado = params[:estado]

    @fotos = MosaicoNatura::MediaMn.where_fotos
                                   .includes(:categoria)
                                   .by_categoria(@categoria_id)
                                   .by_estado(@estado)
                                   .order(:categoria_id, :id)
                                   .page(params[:page])
                                   .per(40)
  end

  private

  def verificar_selector!
    unless current_user_mn&.selector?
      redirect_to mosaico_natura_root_path,
                  alert: "No tienes permisos para acceder a esta sección."
    end
  end
end