class CreateTableTutor < ActiveRecord::Migration[5.1]
  def up
    create_table :tutores do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :telefono_contacto
      t.string :correo
      t.integer :usuario_id, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :tutores
  end
end
