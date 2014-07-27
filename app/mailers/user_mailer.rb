class UserMailer < ActionMailer::Base
  default from: "do-not-reply@example.com"

  def registrant_email(registrant)
  	@registrant = registrant
  	mail(to: ENV["OWNER_EMAIL"], from: @registrant.email, :subject => " New Application Submission")
  end
end
