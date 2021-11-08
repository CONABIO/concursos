class AddPosicionToMedias < ActiveRecord::Migration[5.1]
  def up
    add_column :medias, :posicion, :int
  end

  def down
    remove_column :medias, :posicion
  end
end
