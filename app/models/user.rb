class User < ApplicationRecord
  has_many :creatives, class_name: "Test", inverse_of: :author

  has_many :test_of_users
  has_many :tests, through: :test_of_users

  def tests_by_level(level)
    self.tests.joins(:test_of_users).where(level: level)
  end
end
