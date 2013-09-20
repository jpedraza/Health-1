module WeightsHelper

	def record_weight
		if Weight.where(user_id: params[:id], date_of_entry: Date.today).nil?
			@weight = Weight.new
		else
			@weight = Weight.where(user_id: params[:id], date_of_entry: Date.today)
		end
	end
	
end
