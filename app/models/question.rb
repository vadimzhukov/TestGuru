class Question < ApplicationRecord
  after_create :increase_questions_count_in_test
  after_destroy :decrease_questions_count_in_test

  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :test_passages, foreign_key: :current_question, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :body, presence: true
  validates :test_id, uniqueness: { scope: :body, message: 'Вопрос с таким текстом для данного теста уже существует' }

  private

  def increase_questions_count_in_test
    self.test.update_attribute('questions_count', self.test.questions_count += 1)
  end

  def decrease_questions_count_in_test
    self.test.update_attribute('questions_count', self.test.questions_count -= 1) unless self.test.questions_count == 0
  end
end
