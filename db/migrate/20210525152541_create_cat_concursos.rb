class CreateCatConcursos < ActiveRecord::Migration[5.1]
  def change
    create_table :cat_concursos do |t|
      t.string :nombre_concurso
      t.text :descripcion_concurso

      t.timestamps
    end
  end
end
