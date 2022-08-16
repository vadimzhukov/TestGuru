class QuestionsController < ApplicationController

  before_action :find_test
  
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    render plain: @test.questions.pluck("id", "body").join("\n")
  end

  def show
    render plain: Question.find(params[:id]).body
  end

  def new
  
  end

  def create
    question = Question.create(question_parameters)

    render plain: question.inspect
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    render plain: "Вопрос #{params[:id]} - #{@question.body} был удален из БД"
  end


  private 
  
  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_parameters
    params.require(:question).permit(:body, :test_id)
  end

  def question_not_found
    render plain: "Вопрос с id #{params[:id]} не найден"
  end
end
