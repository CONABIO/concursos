class ChangeNumeroFromDireccion < ActiveRecord::Migration[5.1]
  def up
    change_table :direcciones do |t|
      t.change :numero, :string
    end
  end
 
  def down
    change_table :direcciones do |t|
      t.change :numero, :integer
    end    
  end
end
