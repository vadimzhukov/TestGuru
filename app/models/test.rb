class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"

  has_many :questions

  has_many :test_of_users
  has_many :users, through: :test_of_users

  def self.tests_by_category(category_name)
    Test.joins(:category).where("categories.title" => category_name).order(title: :desc).pluck("tests.title")
  end
end
