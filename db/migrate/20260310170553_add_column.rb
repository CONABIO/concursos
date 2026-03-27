class AddColumn < ActiveRecord::Migration[5.1]
  def change
        add_column :users, :terms_of_service, :boolean

  end
end
