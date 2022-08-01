class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("INNER JOIN test_of_users tu ON tu.test_id = tests.id").where("tests.level = ? AND tu.user_id = ?", level, self.id)
  end
end
