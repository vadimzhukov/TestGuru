module QuestionsHelper
  def question_header(action, test)
    case action.to_sym
    when :new
      "Создайте новый вопрос для теста #{test.title}"
    when :edit
      "Отредактируйте вопрос для теста #{test.title}"
    end
  end
end
