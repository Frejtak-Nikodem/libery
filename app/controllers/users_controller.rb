class UsersController < ApplicationController
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
end
