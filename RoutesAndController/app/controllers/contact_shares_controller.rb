class ContactSharesController < ApplicationController
  def index
    render json: ContactShare.all
  end

  def create
    contact_shares = ContactShare.new(contact_shares_params)
    if contact_shares.save
      render json: contact_shares
    else
      render(
        json: contact_shares.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact_shares = ContactShare.find(params[:id])
    if contact_shares.destroy
      render json: contact_shares
    else
      render json: contact_shares.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def contact_shares_params
    params.require(:contact_shares).permit(:user_id, :contact_id)
  end
end
