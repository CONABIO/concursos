class AddOtraMarcaToMediaMetadatos < ActiveRecord::Migration[5.1]
	def change
	  change_table :media_metadatos do |t|
		  t.string :otra_marca
	  end
  end

  def down
	  change_table :media_metadatos do |t|
		  t.remove :otra_marca
	  end
  end
end
