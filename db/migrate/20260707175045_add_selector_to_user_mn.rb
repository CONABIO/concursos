class AddSelectorToUserMn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :selector, :boolean, default: false
  end
end
