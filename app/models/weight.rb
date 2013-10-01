class Weight < ActiveRecord::Base
  attr_accessible :weight
	
	validates :user_id, :presence => true
	validates :weight, :numericality => true
	
	belongs_to :user
	
	default_scope :order => 'weights.created_at DESC' 

	before_save :add_date, :metric
	
	private
	
	def add_date
		self.date_of_entry ||= Date.today
	end
	
	def metric
		if User.where(user_id).first.metric == 0
			self.weight *= 2.2
		end
	end
	
		
end