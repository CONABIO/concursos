class CreateMediaMetadatos < ActiveRecord::Migration[5.1]
  def change
    create_table :media_metadatos do |t|
      t.integer :metadato_id
      t.integer :media_id
      t.string :valor_metadato

      t.timestamps
    end
  end
end
