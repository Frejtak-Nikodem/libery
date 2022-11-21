class AuthorsController < ApplicationController
    before_action :authenticate_user!
  
    def index  
      @authors = Author.all   
    end
  
    def search
        @q = Author.where(" last_name LIKE ?", "%#{ params[:q] }%")
    end
      
    
      def show
        @authors = Author.find(params[:id])
      end
    
      def new
        @authors = Author.new
      end
    
      def create
        @authors = Author.new(authors_params)
    
        if @authors.save
          redirect_to @authors
        else
          render :new, status: :unprocessable_entity
        end
      end
    
      def edit
        @authors = Author.find(params[:id])
      end
    
      def update
        @authors = Author.find(params[:id])
    
        if @authors.update(authors_params)
          redirect_to @authors
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @authors = Author.find(params[:id])
        @authors.destroy
    
        redirect_to authors_path, status: :see_other
      end
    
      private
        def authors_params
          params.require(:author).permit(:last_name, :biography, :country_of_birth)
        end
end
