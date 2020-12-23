class GbuMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gbu_mailer.reminder.subject
  #
  def reminder
    @greeting = "Hi"

    mail to: "aditig006@gmail.com",
         subject: "Try mail"
  end
end
