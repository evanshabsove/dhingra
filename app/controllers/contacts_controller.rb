class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    @entry = Entry.where(category: "contact").first
  end

  def create
    @contact = Contact.new(update_params)
    if @contact.save
      raise 'hit'
      ContactMeMailer.send_email(@contact)
      redirect_to root_url
      flash[:notice] = "Email succesfully sent!"
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

  private

  def update_params
    params.require(:contact).permit(:name, :subject, :email, :message)
  end
end
