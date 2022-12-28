class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :trackable,  :rememberable, :validatable

  has_many :creatives, class_name: 'Test', foreign_key: 'author_id'

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :feedbacks

  has_many :user_badges
  has_many :badges, through: :user_badges

  # validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :admins, -> { where(type: 'Admin') }

  def tests_by_level(level)
    tests.where(level:)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
