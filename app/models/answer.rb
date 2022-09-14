class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates :question, presence: true

  validate :max_answers

  scope :right, -> { where(correct: true) }

  private

  def max_answers
    errors.add(:question) if question.answers.to_a.count > 4
  end
end
