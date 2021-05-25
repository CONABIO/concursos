class CreateDirecciones < ActiveRecord::Migration[5.1]
  def change
    create_table :direcciones do |t|
      t.string :calle
      t.integer :numero
      t.string :interior
      t.string :colonia
      t.string :municipio
      t.string :cp
      t.string :estado
      t.integer :id_usuario

      t.timestamps
    end
  end
end
