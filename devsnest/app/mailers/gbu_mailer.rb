class GbuMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gbu_mailer.reminder.subject
  #
  def self.send_request
    emails = User.pluck(:email)
    
    emails.each do |email|
      reminder(email).deliver_now   
    end
  end

  def reminder(email)
    @link = "devsnest.in"
  
 
    mail to: email,
         subject: "GBU reminder"
  end
end
