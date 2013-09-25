class Calorie < ActiveRecord::Base
  attr_accessible :date_of_entry, :protein, :fat, :carbs, :fiber, 
									:user_id, :calories, :points
	
	validates :user_id, :presence => true
	validates :protein, :fat, :carbs, :numericality => true
	
	belongs_to :user
	
	default_scope :order => 'calories.created_at DESC' 
	
	before_save :calculate_calories

	private

	def calculate_calories
		self.calories = protein * 4 + carbs * 4 + fat * 9
	end
	
end
