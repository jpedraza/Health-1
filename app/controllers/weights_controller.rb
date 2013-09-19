class WeightsController < ApplicationController

	def create
		@weight = current_user.weight.build(params[:weight])
		if @weight.save
			flash[:success] = "Weight saved!"
			redirect_to root_path
		else
			render 'pages/home'
		end
	end
	
end
