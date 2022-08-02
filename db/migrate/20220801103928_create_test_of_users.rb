class CreateTestOfUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :test_of_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true

      t.timestamps
    end
  end
end
