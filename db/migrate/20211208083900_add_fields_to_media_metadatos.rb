class AddFieldsToMediaMetadatos < ActiveRecord::Migration[5.1]
  def up
    change_table :media_metadatos do |t|
      t.string :marca
      t.string :localidad
    end
  end
 
  def down
    change_table :media_metadatos do |t|
      t.remove :marca
      t.remove :localidad
    end
  end
end
