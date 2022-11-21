class AddQuestionCountToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :questions_count, :integer, null: false, default: 0
  end
end
