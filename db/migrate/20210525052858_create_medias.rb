class CreateMedias < ActiveRecord::Migration[5.1]
  def change
    create_table :medias do |t|
      t.string :original_filename
      t.string :filename
      t.string :titulo
      t.date :fecha_subida
      t.string :ruta
      t.integer :size
      t.integer :id_usuario
      t.integer :id_categoria

      t.timestamps
    end
  end
end
