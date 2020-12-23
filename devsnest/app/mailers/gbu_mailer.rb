class GbuMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gbu_mailer.reminder.subject
  #
  def reminder
    @link = "devsnest.in"


    mail to: "guptaa.aditi02@gmail.com",
         subject: "GBU reminder"
  end
end
