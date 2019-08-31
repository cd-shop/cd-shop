class AddressesController < ApplicationController

	def edit
		@address = Address.find_by(id: params[:id])
	end

	def update
		address = Address.find_by(id: params[:id])
		address.update(address_params)
		redirect_to user_path(current_user.id)
	end

	def destroy
		address = Address.find_by(id: params[:id])
		address.destroy
		redirect_to user_path(current_user.id)
	end

	private

	def address_params
		params.require(:address).permit(:address_number, :prefecture, :municipality, :building)
	end

end
