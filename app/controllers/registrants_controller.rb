class RegistrantsController < ApplicationController

	def new
		@registrant = Registrant.new
	end

	def create
		@registrant = Registrant.new(registrant_params)
		if @registrant.valid?
			 @registrant.update_spreadsheet
			# to send message
			flash[:notice] = "#{@registrant.first_name}, your registration is submitted successfully"
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def registrant_params
		params.require(:registrant).permit(:reason, :problem, :story, :more_story, :experience, :price_range, :first_name, :last_name, :gender, :email, :phone, :age, :residence, :education, :about_us)
	end
	
end