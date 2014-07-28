class RegistrantsController < ApplicationController

	def new
		@registrant = Registrant.new
	end

	def create
		@registrant = Registrant.new(registrant_params)
		if @registrant.valid?
			 @registrant.update_spreadsheet
			 UserMailer.registrant_email(@registrant).deliver
			flash[:notice] = "#{@registrant.first_name}, your application is successfully submitted"
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def registrant_params
		params.require(:registrant).permit(:reason, :problem, :story, :experience, :price_range, :first_name, :last_name, :gender, :email, :phone, :age, :residence, :education, :about_us)
	end
	
end