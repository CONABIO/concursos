class AddUserToUsuario < ActiveRecord::Migration[5.1]
  def up
    add_column :usuarios, :user_id, :int, :null => false
  end

  def down
    remove_column :usuarios, :user_id
  end
end
