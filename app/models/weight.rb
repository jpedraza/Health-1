class Weight < ActiveRecord::Base
  attr_accessible :weight
	
	validates :user_id, :presence => true
	validates :weight, :numericality => true
	
	belongs_to :user
	
	default_scope :order => 'weights.created_at DESC' 

	before_save :add_date
	private
	
	def add_date
		self.date_of_entry ||= Date.today
	end
		
end