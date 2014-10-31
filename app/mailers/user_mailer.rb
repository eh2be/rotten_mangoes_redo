class UserMailer < ActionMailer::Base
  default from: "gregmasuda@gmail.com"

  # def welcome_email(user)
  #   @user = user
  #   @url = 
  # end

  def mail_on_delete(user)
    @user = user
    mail(to: @user.email, subject: "Your Rotten Mangoes account has been deleted by the Administrator.")
  end
  
end
