class CreateBadgeRules < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_rules do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :rule, null: false, foreign_key: true
      t.string :parameters_thresholds

      t.timestamps
    end
  end
end
