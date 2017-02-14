class ContactsController < ApplicationController
  def index
    p "0000000000000000000000000000000000 PARAM ID: #{params[:id]}  000000000"
    all_contacts = Contact.where(user_id: 4) + User.find(4).shared_contacts
    render json: all_contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end

  end

  def destroy
    contact = Contact.find(params[:id])
    if contact.destroy
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :name)
  end
end
