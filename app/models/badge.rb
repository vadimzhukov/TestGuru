class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  has_many :badge_rules
  has_many :rules, through: :badge_rules

  has_one_attached :image

  validates :title, presence: true
  
end
