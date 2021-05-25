class CreateUsuarioMetadatos < ActiveRecord::Migration[5.1]
  def change
    create_table :usuario_metadatos do |t|
      t.integer :id_metadato
      t.integer :id_usuario
      t.string :valor_metadato

      t.timestamps
    end
  end
end
