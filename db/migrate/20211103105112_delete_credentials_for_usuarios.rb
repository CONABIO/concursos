class DeleteCredentialsForUsuarios < ActiveRecord::Migration[5.1]
  def up
    remove_column :usuarios, :email
    remove_column :usuarios, :password_digest
  end
 
  def down
    add_column :usuarios, :email, :string
    add_column :usuarios, :password_digest, :string
  end
end
