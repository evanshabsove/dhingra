class OrderMailer < ApplicationMailer
  default :from => 'alanwebsite@email.com'

  def send_email(order_items, current_user)
    @order_items = order_items
    @current_user = current_user
    mail( :to => ENV['email_address'],
    :subject => "NEW ORDER" )
  end
end
