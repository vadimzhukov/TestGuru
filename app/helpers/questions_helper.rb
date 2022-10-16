module QuestionsHelper
  def question_header(question)
    if question.persisted?
      t('helpers.questions_helper.edit_question', test_title: question.test.title)
    else
      t('helpers.questions_helper.add_question', test_title: question.test.title)
    end
  end
end
