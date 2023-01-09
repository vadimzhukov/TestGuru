class Rule < ApplicationRecord
  has_many :badge_rules
  has_many :badges, through: :badge_rules

end
