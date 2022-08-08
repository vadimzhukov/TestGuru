class User < ApplicationRecord
  has_many :creatives, class_name: "Test", foreign_key: "author_id"

  has_many :test_of_users
  has_many :tests, through: :test_of_users

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
