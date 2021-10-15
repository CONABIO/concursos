class CreateUsuarioMetadatos < ActiveRecord::Migration[5.1]
  def change
    create_table :usuario_metadatos do |t|
      t.integer :metadato_id
      t.integer :usuario_id
      t.string :valor_metadato

      t.timestamps
    end
  end
end
