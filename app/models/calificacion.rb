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
class Calificacion < ApplicationRecord
end
