class MosaicoNatura::InicioController < MosaicoNatura::MosaicoNaturaController

  def index
    @categorias = Categoria::CategoriasMN
    @registro = MosaicoNatura::UsuarioMn.find_by(user_id: current_user_mn.id) if current_user_mn.present?
  end

  def bases
    render partial: 'bases'
  end

  def terminos_condiciones
  end

  def finalistas
    seleccionadas = {
      "Latidos de la vida silvestre" => [
        { id: 8534, posicion: "Finalista" },
        { id: 6206, posicion: "Finalista" },
        { id: 7153, posicion: "Finalista" },
        { id: 6666, posicion: "Finalista" },
        { id: 7364, posicion: "Finalista" },
        { id: 9574, posicion: "Finalista" },
        { id: 8501, posicion: "Finalista" },
        { id: 7154, posicion: "Finalista" },
        { id: 7332, posicion: "Finalista" },
        { id: 6509, posicion: "Finalista" },
        { id: 6641, posicion: "Finalista" }
      ],

      "Plantas y hongos" => [
        { id: 8349, posicion: "Finalista" },
        { id: 10133, posicion: "Finalista" },
        { id: 6216, posicion: "Finalista" },
        { id: 10091, posicion: "Finalista" },
        { id: 9173, posicion: "Finalista" },
        { id: 7175, posicion: "Finalista" },
        { id: 9212, posicion: "Finalista" },
        { id: 9873, posicion: "Finalista" },
        { id: 8366, posicion: "Finalista" },
        { id: 9082, posicion: "Finalista" },
        { id: 7026, posicion: "Finalista" }
      ],

      "Ecosistema y su gente" => [
        { id: 7180, posicion: "Finalista" },
        { id: 9781, posicion: "Finalista" },
        { id: 7181, posicion: "Finalista" },
        { id: 9573, posicion: "Finalista" },
        { id: 8814, posicion: "Finalista" },
        { id: 9946, posicion: "Finalista" },
        { id: 6541, posicion: "Finalista" },
        { id: 7978, posicion: "Finalista" },
        { id: 7489, posicion: "Finalista" },
        { id: 8767, posicion: "Finalista" },
        { id: 9765, posicion: "Finalista" }
      ],

      "Fotografía Macro" => [
        { id: 10115, posicion: "Finalista" },
        { id: 7625, posicion: "Finalista" },
        { id: 8247, posicion: "Finalista" },
        { id: 8916, posicion: "Finalista" },
        { id: 7415, posicion: "Finalista" },
        { id: 7240, posicion: "Finalista" },
        { id: 8480, posicion: "Finalista" },
        { id: 9964, posicion: "Finalista" },
        { id: 9736, posicion: "Finalista" },
        { id: 9738, posicion: "Finalista" },
        { id: 8278, posicion: "Finalista" }
      ],

      "CoSMos" => [
        { id: 6951, posicion: "Finalista" },
        { id: 8511, posicion: "Finalista" },
        { id: 6217, posicion: "Finalista" },
        { id: 8103, posicion: "Finalista" },
        { id: 8547, posicion: "Finalista" },
        { id: 6212, posicion: "Finalista" },
        { id: 9734, posicion: "Finalista" },
        { id: 7127, posicion: "Finalista" },
        { id: 10080, posicion: "Finalista" },
        { id: 7858, posicion: "Finalista" },
        { id: 7905, posicion: "Finalista" }
      ],

      "Alcance de tu mano" => [
        { id: 8372, posicion: "Finalista" },
        { id: 6273, posicion: "Finalista" },
        { id: 10152, posicion: "Finalista" },
        { id: 7702, posicion: "Finalista" },
        { id: 7218, posicion: "Finalista" },
        { id: 7329, posicion: "Finalista" },
        { id: 6274, posicion: "Finalista" },
        { id: 7829, posicion: "Finalista" },
        { id: 10217, posicion: "Finalista" },
        { id: 7984, posicion: "Finalista" },
        { id: 7639, posicion: "Finalista" }
      ],

      "Jóvenes" => [
        { id: 8281, posicion: "Finalista" },
        { id: 7487, posicion: "Finalista" },
        { id: 8988, posicion: "Finalista" },
        { id: 9158, posicion: "Finalista" },
        { id: 8385, posicion: "Finalista" },
        { id: 6405, posicion: "Finalista" },
        { id: 8677, posicion: "Finalista" },
        { id: 6236, posicion: "Finalista" },
        { id: 6237, posicion: "Finalista" },
        { id: 8517, posicion: "Finalista" }
      ]
    }

    ids = seleccionadas.values.flatten.map { |foto| foto[:id] }

    fotos = MosaicoNatura::MediaMn
      .includes(:categoria, :media_metadato)
      .where(id: ids)

    fotos_por_id = fotos.index_by(&:id)

    @finalistas = seleccionadas.transform_values do |lista|
      lista.map do |datos|
        {
          foto: fotos_por_id[datos[:id]],
          posicion: datos[:posicion]
        }
      end.compact
    end
  end
end