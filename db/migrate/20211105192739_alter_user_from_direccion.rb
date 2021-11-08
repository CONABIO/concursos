class AlterUserFromDireccion < ActiveRecord::Migration[5.1]
  def up
    change_table :direcciones do |t|
      t.change :usuario_id, :integer, :null => false
    end
  end
 
  def down
    change_table :direcciones do |t|
      t.change :usuario_id, :integer, :null => true
    end    
  end
end
