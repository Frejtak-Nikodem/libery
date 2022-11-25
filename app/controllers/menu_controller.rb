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

	def users_book
		@users = User.all
		@books = Book.all
	end

	def user_dashboard
		@users = User.all
		@books = Book.all
	end

	def admin_dashboard
		@users = User.all
		@books = Book.all
	end

	
end
