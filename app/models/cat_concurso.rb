# == Schema Information
#
# Table name: cat_concursos
#
#  id                   :bigint           not null, primary key
#  descripcion_concurso :text(65535)
#  nombre_concurso      :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class CatConcurso < ApplicationRecord
end
