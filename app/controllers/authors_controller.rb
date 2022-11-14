class AuthorsController < ApplicationController
    def index  

      @authors = Author.all   
      @q = Author.ransack(params[:q])
      @wynik = @q.result
    end
  
    def search
      @q = Author.ransack(params[:q])
      @wynik = @q.result
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
