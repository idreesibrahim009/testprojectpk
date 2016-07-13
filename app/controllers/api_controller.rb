class ApiController < ApplicationController
include ApiHelper  
before_filter :authenticate_user!,:only=>[:user_list]	
before_action :set_user, only: [:edit_user, :update_user,:remove_user]
before_action :parse_json , only: [:find_users,:create_user]
  def index
  end
  def user_list
  	@users=User.get_all_users
  end
  def find_users
    json_parse=@json_parse
    if json_parse['role'].present?
      ##include helper
      users=FetchInformOfUserAccordingToRole(json_parse['role'])
    end
    ## include function in helper
    respond_with_json users 
  end
  def create_user
    json_parse=@json_parse
    if json_parse.present? and json_parse['email'].present? and json_parse['role'].present? and json_parse['password'].present?
      json_parse["password_confirmation"] = json_parse['password']
      message = User.create_user(json_parse)
    else
      message ="data is invalid please require email and password along role"
    end
    response = {"response": "#{message}"}
    respond_with_json response
  end
  def edit_user
  end
  def update_user
  	if @user.update(:email=>params[:user][:email],:role=>params[:user][:role])
  		# puts "ok"
  		redirect_to api_user_list_path,:notice=>"successfully updated"
  	else
  		redirect_to api_user_list_path,:alert=>@user.errors.full_messages	
  	end
  end
  def remove_user
  	if @user.delete
  		redirect_to api_user_list_path,:notice=>"Record Successfully deleted!"
  	end
  end
  private
  def set_user
  	@user = User.find(params[:id])
  end
  def parse_json
    if(valid_json?(params[:data]) ==true)
      @json_parse = JSON.parse(params[:data])
    end
  end
end
