class QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_question
  
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    render plain: @test.questions.pluck("id", "body").join("\n")
  end

  def show
    render plain: @question.body
  end

  def new
  
  end

  def create
    new_question = Question.new(question_parameters)

    begin
      new_question.save!
      render plain: "Вопрос сохранен в БД: #{new_question.inspect}"
    rescue => exception
      render plain: "Вопрос не был сохранен в БД, ошибка: #{exception}"
    end
    
  end

  def destroy
    @question.destroy
    render plain: "Вопрос #{params[:id]} - #{@question.body} был удален из БД"
  end


  private 
  
  def find_test
    if params[:test_id]
      @test = Test.find(params[:test_id])
    end
  end

  def find_question
    if params[:id]
      @question = Question.find(params[:id])
    end
  end

  def question_parameters
    params.require(:question).permit(:body, :test_id)
  end

  def question_not_found
    render plain: "Вопрос с id #{params[:id]} не найден"
  end
end
