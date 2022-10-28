class Gist < ApplicationRecord
  belongs_to :test_passage
  belongs_to :question
end
