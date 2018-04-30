class Notifier < ApplicationMailer
  default from: "no-reply@jungle.com",
    return_path: 'system@jungle.com'

  def confirmation(order)
    @order = order
    @items = Order.find(@order.id).line_items.all
    mail(to: @order.email, subject: "Order ##{@order.id} - confirmation") do |format|
      format.html
    end
  end
end

class NotifierPreview < ActionMailer::Preview
  def confirmation
    Notifier.confirmation(Order.first)
  end
end