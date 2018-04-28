class Notifier < ApplicationMailer
  default from: "no-reply@jungle.com",
    return_path: 'system@jungle.com'

  def confirmation(recipient, order)
    @account = recipient
    mail(to: recipient.email) do |format|
      format.html
    end
    subject: "Order #{order} confirmation"
  end
end
