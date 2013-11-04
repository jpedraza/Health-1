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
		@calories = Calorie.where(user_id: current_user.id)
		@calorie = Calorie.new
		@title = "Record Macro Data"
		@user = current_user
		gon.user_name = @user.name
		calorie_array = []
		@calories.each do |holder|
			calorie_array << [holder.date_of_entry, (holder.protein.round(1)*4), 
				(holder.fat.round(1)*9), (holder.carbs.round(1)*4), holder.points]
		end
		gon.calories = calorie_array
	end
	
end
