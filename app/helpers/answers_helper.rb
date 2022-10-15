module AnswersHelper
  def answer_header(answer)
    if answer.persisted?
      t('helpers.answers_helper.edit_answer', question_body: answer.question.body)
    else
      t('helpers.answers_helper.add_answer', question_body: answer.question.body)
    end
  end
end
