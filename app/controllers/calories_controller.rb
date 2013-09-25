class CaloriesController < ApplicationController

	def create
		@calorie = current_user.calorie.build(params[:calorie])
		if Calorie.where(user_id: current_user.id, date_of_entry: @calorie.date_of_entry).exists? && @calorie.valid?
			Calorie.where(user_id: current_user.id, date_of_entry: @calorie.date_of_entry).destroy_all
		end
		if @calorie.save
			flash[:success] = "Macros saved!"
		else
			flash[:failure] = "That wasn't a number."
		end
		redirect_to calories_path
	end
	
	def index
		@calories = Calorie.paginate(:page => params[:page]).where(user_id: current_user.id)
		@calorie = Calorie.new
		@title = "Record Macro Data"
	end
	
end
