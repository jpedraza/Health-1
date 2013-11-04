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
		@title = "Enter Today's Weight"
		@user = current_user
		gon.user_name = @user.name
		entry_array = []
<<<<<<< HEAD
		if @user.metric == 1 
			@weights.each do |holder|
				entry_array << [holder.date_of_entry, holder.weight.round(1)]
			end
		else
			@weights.each do |holder|
				entry_array << [holder.date_of_entry, (holder.weight / 2.2 ).round(1)]
			end
=======
		@weights.each do |holder|
			entry_array << [holder.date_of_entry, holder.weight.round(1)]
>>>>>>> 0038b3daa4a195f902512ed651df434a55863411
		end
		gon.entries = entry_array
	end
	
end
