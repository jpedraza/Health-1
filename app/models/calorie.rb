class Calorie < ActiveRecord::Base
  attr_accessible :date_of_entry, :protein, :fat, :carbs, :fiber, 
									:user_id, :calories, :points
	
	validates :user_id, :presence => true
	validates :protein, :fat, :carbs, :numericality => true
	
	belongs_to :user
	
	default_scope :order => 'calories.date_of_entry DESC' 
	
	before_save :calculate_calories, :calculate_points
	
	after_save :update_user_points

	private

	def update_user_points
		self.user.update_calorie_points!
	end
	
	# Quite simply, calculates how many calories the user consumed from a protein / fat / carb breakdown.
	
	def calculate_calories
		self.calories = (protein * 4) + (carbs * 4) + (fat * 9)
	end
	
	# calculate_calories is where a user is rewarded for adhearing to good diet specifications.
	# 1 point each for making sure at least 25% of calories come from fat and carbs (to ensure 
	# people eat enough) and 1, 2, or 3 points for getting over 30%, 35%, or 40% calories 
	# from protein. Plus, 1 or 2 points for being with 10% or 5% of daily calories. 
	# Also, if a user goes over 120% or 140% of their calorie recommendation then they are docked a point.
	
	def calculate_points
		self.points = 0
		new_weight = Weight.where(user_id: user_id).first.weight
		if ( new_weight * 10 / 4 / 4 ) < self.carbs
			self.points += 1
		end
		if ( new_weight * 10 / 4 / 9 ) < self.fat
			self.points += 1
		end
		if ( new_weight * 3 / 4 ) < self.protein
			self.points += 1
			if ( new_weight * 3.5 / 4 ) < self.protein
				self.points += 1
				if ( new_weight * 4 / 4 ) < self.protein
					self.points += 1
				end
			end
		end
		if ( new_weight * 9 < self.calories && self.calories < new_weight * 11 )
			self.points += 1
			if ( new_weight * 9.5 < self.calories && self.calories < new_weight * 10.5 )
				self.points += 1
			end
		elsif ( new_weight * 12 < self.calories ) 
			self.points -= 1
			if ( new_weight * 14 < self.calories ) 
				self.points -= 1
			end
		end
	end
	
end
