class Test < ApplicationRecord
  has_many :test_of_users
  has_many :users, through: :test_of_users

  def self.tests_by_category(category_name)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title" => category_name).order(title: :desc).pluck("tests.title")
  end
end
