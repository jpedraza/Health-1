class Calorie < ActiveRecord::Base
  attr_accessible :date_of_entry, :protein, :fat, :carbs, :fiber, 
									:user_id, :calories, :points
	
	validates :user_id, :presence => true
	validates :protein, :fat, :carbs, :numericality => true
	
	belongs_to :user
	
	default_scope :order => 'calories.date_of_entry DESC' 
	
	before_save :calculate_calories, :calculate_points

	private

	def calculate_calories
		self.calories = (protein * 4) + (carbs * 4) + (fat * 9)
	end
	
	def calculate_points
		self.points = 0
		if ( Weight.where(user_id: user_id).first.weight * 10 / 4 / 4 ) < self.carbs
			self.points += 1
		end
		if ( Weight.where(user_id: user_id).first.weight * 10 / 4 / 9 ) < self.fat
			self.points += 1
		end
		if ( Weight.where(user_id: user_id).first.weight * 3 / 4 ) < self.protein
			self.points += 1
			if ( Weight.where(user_id: user_id).first.weight * 3.5 / 4 ) < self.protein
				self.points += 1
				if ( Weight.where(user_id: user_id).first.weight * 4 / 4 ) < self.protein
					self.points += 1
				end
			end
		end
		if ( Weight.where(user_id: user_id).first.weight * 0.9 < self.calories && self.calories < Weight.where(user_id: user_id).first.weight * 1.1 )
			self.points += 1
			if ( Weight.where(user_id: user_id).first.weight * 0.95 < self.calories && self.calories < Weight.where(user_id: user_id).first.weight * 1.05 )
				self.points += 1
			end
		elsif ( Weight.where(user_id: user_id).first.weight * 12 < self.calories ) 
			self.points -= 1
			if ( Weight.where(user_id: user_id).first.weight * 14 < self.calories ) 
				self.points -= 1
			end
		end
	end
	
end
