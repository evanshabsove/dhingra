class ContactMeMailer < ApplicationMailer
  default :from => 'alanwebsite@email.com'

# send a signup email to the user, pass in the user object that   contains the user's email address
  def send_email(contact)
    @contact = contact
    mail( :to => ENV['email_address'],
    :subject => @contact.subject )
  end
end
