class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.submitted.subject
  #
  def submitted(message)
    @message = message

    mail to: 'dima.alex.koval@gmail.com', subject: 'Новое сообщение от пользователя | SPA-Studio'
  end
end
