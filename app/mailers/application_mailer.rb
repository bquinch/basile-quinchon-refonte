class ApplicationMailer < ActionMailer::Base
  default from: ENV["DEVELOPER_EMAIL_ADDRESS"]
  layout "mailer"
end
