class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	########################### authentication before sign in ############################
	def after_sign_in_path_for(resource)
		flash[:notice] = "You have successfully signed in."
		if current_user.role == "admin"
		  stored_location_for(resource) || api_user_list_path
		else
		  # stored_location_for(resource) || beatbook_map_path
		  stored_location_for(resource) || root_path
		end
	end  
	########################### authentication after sign out ############################
	def after_sign_out_path_for(resource)
		flash[:notice] = "You have signed out"
		#root_path
		user_session_path
	end
	def after_sign_up_path_for(resource)
		signed_in_root_path(resource)
	end
	########################### can can unauthroize person ###############################
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end	    
	def respond_with_json response
		render json: response
	end
	def valid_json?(json)
		if json.present?	
		  begin
		    JSON.parse(json)
		    return true
		  rescue JSON::ParserError => e
		    make_a_json_response("#{e}")
		  end
		else
			make_a_json_response("invalid user formate!")
		end
	end	
	def make_a_json_response res
		respond_with_json [{"response": "#{res}"}]
	end
end
