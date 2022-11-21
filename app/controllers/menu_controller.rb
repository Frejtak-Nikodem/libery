class MenuController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	
	def index  
		@users = User.all   
	end
	
	def show
		@users = User.find(params[:id])
	end
	
	def destroy
		@users = User.find(params[:id])
		@users.destroy
	
		redirect_to menu_accounts_path, notice: "User deleted."
	end

	def accounts
		@users = User.all
	end

end
