class DropTestOfUsersTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :test_of_users, if_exists: true
  end

  def down; end
end
