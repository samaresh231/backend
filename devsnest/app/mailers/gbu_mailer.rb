class GbuMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.gbu_mailer.reminder.subject
  #
  def reminder
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end