# == Schema Information
#
# Table name: categorias
#
#  id               :bigint           not null, primary key
#  nombre_categoria :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cat_concurso_id  :integer
#
class MosaicoNatura::CategoriaMn < Categoria
	
	has_many :media, inverse_of: :media, foreign_key: :categoria_id, class_name: "MediaMn"

end
