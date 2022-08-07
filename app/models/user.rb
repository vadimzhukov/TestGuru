class User < ApplicationRecord
  has_many :tests

  has_many :test_of_users
  has_many :tests, through: :test_of_users

  def tests_by_level(level)
    Test.joins(:test_of_users).where("tests.level = ? AND tu.user_id = ?", level, self.id)
  end
end
