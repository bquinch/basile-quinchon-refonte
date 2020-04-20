class MessageMailer < ApplicationMailer
  require 'mailgun-ruby'

  def contact(message)
    @name = message.name
    @body = message.body

    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    message_params = {:from => message.email,
                      :to => 'basile.quinchon@gmail.com',
                      :subject => message.subject,
                      :text => message.body}
    mg_client.send_message 'sandboxf777fcf6c09047d0a1b259b62580524b.mailgun.org', message_params
  end
end
