class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :p_apellido
      t.string :m_apellido
      t.date :fec_nac
      t.string :lugar_nac
      t.string :curp

      t.timestamps
    end
  end
end
