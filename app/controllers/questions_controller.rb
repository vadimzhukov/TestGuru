class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    render plain: @test.questions.pluck('id', 'body').join("\n")
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    new_question = @test.questions.build(question_parameters)

    if new_question.save
      render plain: "Вопрос сохранен в БД: #{new_question.inspect}"
    else
      render plain: 'Вопрос не был сохранен в БД, при сохранении возникла ошибка'
    end
  end

  def destroy
    @question.destroy
    render plain: "Вопрос #{params[:id]} - #{@question.body} был удален из БД"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_parameters
    params.require(:question).permit(:body)
  end

  def question_not_found
    render plain: "Вопрос с id #{params[:id]} не найден"
  end
end
