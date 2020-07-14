class MessageMailer < ApplicationMailer
  def contact_me(message)
    @name = message.name
    @mail = message.email
    @body = message.body
    mail to: 'enmanuelm19@gmail.com', from: message.email
  end
end
