class AddUserIdToCalificacion < ActiveRecord::Migration[5.1]
	def up
		add_column :calificaciones, :usuario_id, :int, :null => false
		change_column :calificaciones, :medias_id, :int, :null => true
  end

  def down
    remove_column :calificaciones, :usuario_id
  end
end
