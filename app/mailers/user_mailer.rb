class UserMailer < ActionMailer::Base
  default from: :"tunghdt91@gmail.com"

  def welcome_email(user)
    host = "http://localhost:3000/users"
    @url = "http://localhost:3000/users"
    mail(to: user.email, subject: "Welcome to My Awesome Site")
  end

  def mail_confirm(user)
  	
  	
  end
end
