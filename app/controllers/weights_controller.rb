class WeightsController < ApplicationController

	def create
		@weight = current_user.weight.build(params[:weight])
		if Weight.where(user_id: current_user.id, date_of_entry: Date.today).exists? && @weight.valid?
			Weight.where(user_id: current_user.id, date_of_entry: Date.today).destroy_all
		end
		if @weight.save
			current_user.current_weight = @weight.weight
			flash[:success] = "Weight saved!"
			redirect_to weights_path
		else
			flash[:failure] = "That wasn't a number."
			redirect_to weights_path
		end
	end
	
	def index
		@weights = Weight.paginate(:page => params[:page]).where(user_id: current_user.id)
		@weight = Weight.new
		if Weight.where(user_id: current_user.id, date_of_entry: Date.today).exists?
			flash[:success] = "There's already an entry for today."
		end
	end
	
end
