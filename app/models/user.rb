class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise 	:database_authenticatable, 
			:registerable,
			:recoverable, 
			:rememberable, 
			:trackable, 
			:validatable
    scope :find_users, -> (role) { where("role=?",role)} 
	def self.role
		return ["admin","user","gues"]
	end         
	def self.create_new_user role
	  	fake_email=Faker::Internet.email
	  	fake_password=Faker::Internet.password(8)
	  	user = User.new(:email=>fake_email,:password=>fake_password,:password_confirmation=>fake_password,:role=>"#{role}")
	  	if user.save
	  		puts "email = #{fake_email}"
	  		puts "password = #{fake_password}"
	  	else
	  		puts "oops! #{user.errors.full_messages}"
	  	end	
	end	
	def self.get_all_users
		user = User.all
	end
	def self.create_user json_data
      user = User.new(json_data)
      if user.save
        message = "Successfully Saved"
      else
        message = user.errors.full_messages
      end
      return message
	end
end
