module AnswersHelper
  def answer_header(answer)
    if answer.persisted?
      "Отредактируйте ответ для вопроса #{answer.question.body}"
    else
      "Создайте новый ответ для вопроса #{answer.question.body}"
    end
  end
end
