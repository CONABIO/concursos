class AlterTableMediaMetadatos < ActiveRecord::Migration[5.1]
  def up
    change_table :media_metadatos do |t|
      t.remove :metadato_id
      t.remove :valor_metadato
      t.string :titulo
      t.text :descripcion
      t.text :tecnica
      t.text :compromiso
      t.change :media_id, :integer, :null => false
    end
  end
 
  def down
    change_table :media_metadatos do |t|
      t.integer :metadato_id
      t.string :valor_metadato
      t.remove :titulo
      t.remove :descripcion
      t.remove :tecnica
      t.remove :compromiso
      t.change :media_id, :integer, :null => true
    end
  end
end
