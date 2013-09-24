class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :password, :points, :password_confirmation
  
  has_many :weight, :dependent => :destroy
  						
 email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, :presence => true,
					:length => { :maximum => 50 }
  validates :email, :presence => true,
					:format => { :with => email_regex },
					:uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
											 :confirmation => true,
											 :length => { :within => 6..40 }
											 
	
  before_save :encrypt_password
	
	before_create :default_points
	
 
  def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil	if user.nil?
		return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
  end
	
	def set_original_weight=(weight)
		@original_weight = weight
	end
	
	def set_current_weight(weight)
		self.current_weight = 100
	end
	
  private
  
	def default_points
		self.points ||= 0
	end
	
	def encrypt_password
		self.salt = make_salt if new_record?
		self.encrypted_password = encrypt(password)
	end
	
	def encrypt(string)
		secure_hash("#{salt}--#{string}")
	end	
	
	def make_salt
		secure_hash("#{Time.now.utc}--#{password}")
	end
	
	def secure_hash(string)
		Digest::SHA2.hexdigest(string)
	end	
  
end
