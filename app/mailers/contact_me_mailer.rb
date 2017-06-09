class ContactMeMailer < ApplicationMailer
  default :from => 'alanwebsite@email.com'

# send a signup email to the user, pass in the user object that   contains the user's email address
  def send_email(contact)
    raise 'hit'
    @contact = contact
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
