class Calorie < ActiveRecord::Base
  attr_accessible :date_of_entry, :protein, :fat, :carbs, :fiber, :user_id
end
