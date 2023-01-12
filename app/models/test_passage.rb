class TestPassage < ApplicationRecord
  attr_accessor :question_index

  SUCCESS_THRESHOLD = 0.8

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :gists, dependent: :destroy

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def accept!(answer_ids)
    self.correct_answers_count += 1 if correct_answer?(answer_ids)
    save!
  end

  def set_final_status
    self.update_attribute(:successfully, true) if successful?
  end


  def correct_answers_part
    (correct_answers_count.to_f / test.questions.count.to_f).round(1)
  end

  def successful?
    correct_answers_part >= SUCCESS_THRESHOLD 
  end

  def expired?
      Time.now - self.test.timer > self.created_at if self.test.timer
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == if answer_ids
                                  answer_ids.map(&:to_i).sort
                                else
                                  []
                                end
  end

  def correct_answers
    current_question.answers.right
  end

  def before_validation_set_first_question
    self.current_question = test.questions.order(:id).first if test.present?
  end

  def after_validation_set_question_index
    set_question_index
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first if current_question
    set_question_index
  end

  def set_question_index
    self.question_index = test.questions.order(:id).where('id <= ?', current_question.id).count if current_question
  end
end
