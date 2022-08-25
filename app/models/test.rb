class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy

  has_many :test_of_users, dependent: :destroy
  has_many :users, through: :test_of_users, dependent: :destroy

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greter_than: 0 }
  validates :level, uniqueness: {scope: :title, message: "Тест с таким названием и уровнем сложности уже существует"}

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category_name) { joins(:category).
                                           where("categories.title" => category_name) }

  scope :tests_by_level, -> (level) { where("tests.level" => level) }

  def self.tests_by_category(category_name)
    by_category(category_name).order(title: :desc).pluck("tests.title")
  end
end
