class User < ApplicationRecord
  has_many :creatives, class_name: 'Test', foreign_key: 'author_id'

  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  def tests_by_level(level)
    tests.where(level:)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
