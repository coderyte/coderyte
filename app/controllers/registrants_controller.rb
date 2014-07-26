class RegistrantsController < ApplicationController

	def new
		@registrant = Registrant.new
	end

	def create
		@registrant = Registrant.new(registrant_params)
		if @registrant.valid?
			# to do save data
			# to send message
			flash[:notice] = "Registration successful #{@registrant.first_name}"
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def registrant_params
		params.require(:registrant).permit(:reason, :problem, :story, :more_story, :experience, :price_range, :first_name, :last_name, :email, :phone, :age, :residence, :education)
	end
	
end