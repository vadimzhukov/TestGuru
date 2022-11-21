class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback, recipient)
    @fb = feedback
    mail(to: recipient.email, subject: "Feedback from #{@fb.user.email}")
  end
end
