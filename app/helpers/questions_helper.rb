module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Отредактируйте вопрос для теста #{question.test.title}"
    else
      "Создайте новый вопрос для теста #{question.test.title}"
    end
  end
end
