class CreateMediaMetadatos < ActiveRecord::Migration[5.1]
  def change
    create_table :media_metadatos do |t|
      t.integer :id_metadato
      t.integer :id_media
      t.string :valor_metadato

      t.timestamps
    end
  end
end
