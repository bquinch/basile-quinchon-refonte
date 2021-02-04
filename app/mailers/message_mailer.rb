class MessageMailer < ApplicationMailer
  def contact(message)
    @name = message.name
    @body = message.body
    @message = message
    message_params = {
      from: ENV["DEVELOPER_EMAIL_ADDRESS"],
      to: ENV["DEVELOPER_EMAIL_ADDRESS"],
      subject: message.subject,
      text: message.body,
      reply_to: message.email,
    }
    mail(message_params)
  end
end
