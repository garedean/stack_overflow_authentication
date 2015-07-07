class UserMailer < ApplicationMailer
  default from: "welcome@stackanswers.com"

  def welcome_email(user)
    @user = user

    mail to: "fakeemail@nowhere.com", subject: "Welcome to StackAnswers!"
  end
end
