class AddressesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.user_id == current_user.id
    @address.save
    redirect_to user_path(@user)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def destroy
  end

  def update
  end

  private
  def address_params
    params.require(:address).permit(:prefecture, :municipality, :address_number, :building)
  end
end
