module ApiHelper
	def FetchInformOfUserAccordingToRole role
		users=User.find_users(role)
		if users.present?
			return users
		else
			return {"response": "No User Found!"}
		end
	end
end
