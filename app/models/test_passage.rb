class TestPassage < ApplicationRecord

  attr_accessor :question_index
  
  SUCCESS_THRESHOLD = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  after_initialize :after_initialize_set_question_index
  before_validation :before_validation_set_first_question, on: :create
  before_update :after_update_set_next_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_answers_count += 1
    end
    save!
  end

  def correct_answers_part
    (correct_answers_count.to_f / test.questions.count.to_f).round(3)
  end

  def successful?
    correct_answers_part >= SUCCESS_THRESHOLD
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.right
  end

  def after_initialize_set_question_index
    self.question_index = 1
  end

  def before_validation_set_first_question
    self.current_question = test.questions.order(:id).first if test.present?
  end

  def after_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    self.question_index += 1
  end
end
