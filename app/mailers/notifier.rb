class Notifier < ActionMailer::Base
  default from: "jobsjugaad@gmail.com"

  def send_email_from_DJ
    @email = "aditya.kapoor@vinsol.com"
    mail(:to => @email, :subject => "DJ Demonstration from Mongoid")
  end
end
