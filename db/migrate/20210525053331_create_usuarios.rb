class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.date :fecha_nacimiento
      t.string :lugar_nacimiento
      t.string :password_digest

      t.timestamps
    end
  end
end
