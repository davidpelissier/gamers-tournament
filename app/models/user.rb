class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Define the default role for a User
  before_save :default_role
  def default_role
  	self.role ||= 'player'
  end

 	# Role of the user. That field is used to restrict access
  enum role: ['admin', 'player']

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login


  # Validation of the username
  validates :username,
	  :presence => true,
	  :uniqueness => {
	    :case_sensitive => false
	  }

	# Authentication stack 
	# function find_for_database_authentication calls find_for_authentication which calls find_first_by_auth_conditions   
  def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    if conditions[:username].nil?
	      where(conditions).first
	    else
	      where(username: conditions[:username]).first
	    end
	  end
	end


end