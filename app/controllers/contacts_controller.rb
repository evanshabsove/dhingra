class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    @entry = Entry.where(category: "contact").first
  end

  def create
    @contact = Contact.new(update_params)

    unless verify_recaptcha(params[:recaptcha_token], 'contact')
      flash.now[:error] = t('recaptcha.errors.verification_failed')
      return render :new
    end

    if @contact.save
      ContactMeMailer.send_email(@contact).deliver
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
