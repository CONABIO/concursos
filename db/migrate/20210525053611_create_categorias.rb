class CreateCategorias < ActiveRecord::Migration[5.1]
  def change
    create_table :categorias do |t|
      t.string :nombre_categoria
      t.integer :cat_concurso_id

      t.timestamps
    end
  end
end
