class AddReviewedToMedias < ActiveRecord::Migration[5.1]
  def change
    add_column :medias, :reviewed, :boolean, default: false, null: false
  end
end
