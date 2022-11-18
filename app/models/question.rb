class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :test_passages, foreign_key: :current_question, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :body, presence: true
  validates :test_id, uniqueness: { scope: :body, message: 'Вопрос с таким текстом для данного теста уже существует' }
end
