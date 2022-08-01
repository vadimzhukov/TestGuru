class User < ApplicationRecord
  def tests_by_level(level)
   Test.where(level: level, user_id: self.id)
  end
end
