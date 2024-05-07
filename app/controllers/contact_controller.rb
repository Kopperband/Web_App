class ContactController < ApplicationController

  def index
    @contact = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contact_path, notice: "Contact Incoming!"
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :comment)
  end

end
