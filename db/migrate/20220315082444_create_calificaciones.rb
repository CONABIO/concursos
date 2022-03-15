class CreateCalificaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :calificaciones do |t|
      t.integer :medias_id
      t.integer :calificacion

      t.timestamps
    end
  end
end
