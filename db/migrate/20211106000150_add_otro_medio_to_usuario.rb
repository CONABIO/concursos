class AddOtroMedioToUsuario < ActiveRecord::Migration[5.1]
  def up
    add_column :usuarios, :otro_medio, :string
  end

  def down
    remove_column :usuarios, :otro_medio
  end
end
