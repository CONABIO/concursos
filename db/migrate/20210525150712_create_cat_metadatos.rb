class CreateCatMetadatos < ActiveRecord::Migration[5.1]
  def change
    create_table :cat_metadatos do |t|
      t.string :nombre_metadato
      t.string :descripcion
      t.string :ancestry

      t.timestamps
    end
  end
end
