class CreateUserBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :user_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true
      t.integer "test_passage_id", null: false

      t.timestamps
    end
  end
end
