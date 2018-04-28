class Notifier < ApplicationMailer
  return_path: 'system@jungle.com'

  def confirmation(recipient)
    @account = recipient
    mail(to: recipient.email)
  end
end
