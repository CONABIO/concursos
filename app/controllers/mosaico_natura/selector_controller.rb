class MosaicoNatura::SelectorController < MosaicoNatura::MosaicoNaturaController
  before_action :verificar_selector!
  def index
    @foto = MosaicoNatura::MediaMn.where_fotos.pending_selection.sin_calificacion.includes(:categoria).order(:categoria_id, :id).first
    @total = MosaicoNatura::MediaMn.where_fotos.sin_calificacion.count
    @revisadas = MosaicoNatura::MediaMn.where_fotos.where(reviewed: true).count
  end

  def update
    @foto = MosaicoNatura::MediaMn.find(params[:id])
    @foto.update(reviewed: true,selected: ActiveModel::Type::Boolean.new.cast(params[:selected])
    )
    redirect_to mosaico_natura_selector_index_path
  end
  def gallery
    @categorias = MosaicoNatura::CategoriaMn.order(:nombre_categoria)

    @categoria_id = params[:categoria_id]
    @estado = params[:estado]

    @fotos = MosaicoNatura::MediaMn.where_fotos
                               .sin_calificacion
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
      redirect_to mosaico_natura_root_path,alert: "No tienes permisos para acceder a esta sección."
    end
  end
end