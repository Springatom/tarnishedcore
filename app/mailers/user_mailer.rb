class UserMailer < ApplicationMailer
  def welcome_email(email)
    validation_code = ValidationCode.order(created_at: :desc).find_by_email(email)
    @code = validation_code.code
    mail(to: email, subject: "[#{@code}]号褪色者啊")
  end
end
