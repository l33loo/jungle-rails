class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  notifier 'confirmation'
end
