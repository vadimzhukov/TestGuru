class AddSuccessfullyToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :successfully, :bool, default: false
  end
end
