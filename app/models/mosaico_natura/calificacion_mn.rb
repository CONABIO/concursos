# == Schema Information
#
# Table name: calificaciones
#
#  id           :bigint           not null, primary key
#  calificacion :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  media_id     :integer
#  usuario_id   :integer
#
class MosaicoNatura::CalificacionMn < Calificacion

    belongs_to :usuario, class_name: "UsuarioMn"
    belongs_to :media, class_name: "MediaMn"
    validates_presence_of :calificacion, :media_id, :usuario_id

end
