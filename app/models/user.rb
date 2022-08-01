class User < ApplicationRecord
  def tests_by_level(level)
   TestOfUser.joins("INNER JOIN tests t ON test_of_users.test_id = t.id").select("t.*").where("t.level = ? AND test_of_users.user_id = ?", level, self.id)
  end
end
