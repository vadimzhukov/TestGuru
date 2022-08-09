class Question < ApplicationRecord
  belongs_to :test

  has_many :answers

  validates :body, presence: true
  validate :validate_answers_count  

  private

  def validate_answers_count
    errors.add(:answers) unless answers.to_a.count.between?(1, 4)
  end

end
