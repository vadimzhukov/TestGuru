class Test < ApplicationRecord
  def self.tests_by_category(category_name)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title" => category_name).order(title: :desc).pluck("tests.title")
  end
end
