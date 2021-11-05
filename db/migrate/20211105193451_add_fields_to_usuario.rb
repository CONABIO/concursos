class AddFieldsToUsuario < ActiveRecord::Migration[5.1]
  def up
    change_table :usuarios do |t|
      t.string :medio
      t.integer :concurso_id, :null => false
    end
  end
 
  def down
    remove_column :usuarios, :concurso_id
    remove_column :usuarios, :medio
  end
end
