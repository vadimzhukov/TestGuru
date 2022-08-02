class RenameTitileToTitleInTests < ActiveRecord::Migration[6.1]
  def change
    change_table :tests do |t|
     t.rename :titile, :title
    end
  end
end
