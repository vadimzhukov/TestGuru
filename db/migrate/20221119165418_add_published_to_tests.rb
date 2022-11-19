class AddPublishedToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :published, :boolean, null: false, default: false
  end
end
