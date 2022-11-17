class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      User.admins.each do |adm|
        FeedbacksMailer.send_feedback(@feedback, adm).deliver_later
      end
      redirect_to tests_path, notice: 'Ваш отзыв успешно отправлен администратору'
    else
      render :new, alert: 'При отправке отзыва возникла ошибка, повторите попытку позже'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
