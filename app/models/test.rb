class Test < ApplicationRecord
  def self.tests_by_category(category_name)
    result = []
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title" => category_name).select("tests.title").each {|t| result << t.title}
    result.sort{|x, y| y <=> x}
  end
end
