class Notifier < ApplicationMailer
  return_path: 'system@jungle.com'

  def confirmation(recipient, order)
    @account = recipient
    mail(to: recipient.email)
    subject: "Order #{order} confirmation"
  end
end
