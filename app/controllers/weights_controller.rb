class WeightsController < ApplicationController

	def create
		@weight = current_user.weight.build(params[:weight])
		if Weight.where(user_id: current_user.id, date_of_entry: Date.today).exists? && @weight.valid?
			Weight.where(user_id: current_user.id, date_of_entry: Date.today).destroy_all
		end
		if @weight.save
			flash[:success] = "Weight saved!"
		else
			flash[:failure] = "That wasn't a number."
		end
		redirect_to weights_path
	end
	
	def index
		@weights = Weight.paginate(:page => params[:page]).where(user_id: current_user.id)
		@weight = Weight.new
		@title = "Please enter what you weigh today."
		# if Weight.where(user_id: current_user.id, date_of_entry: Date.today).exists?
		#	flash[:success] = "There's already an entry for today."
		# end
	end
	
end
