class BooksController < ApplicationController
    def index  
  
      @books = Book.all   
    end
  
    def show
      @books = Book.find(params[:id])
    end
  
    def new
      @books = Book.new
    end
  
    def create
      @books = Book.new(books_params)
  
      if @books.save
        redirect_to @books
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @books = Book.find(params[:id])
    end
  
    def update
      @books = Book.find(params[:id])
  
      if @books.update(books_params)
        redirect_to @books
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @books = Book.find(params[:id])
      @books.destroy
  
      redirect_to books_path, status: :see_other
    end
  
    private
      def books_params
        params.require(:book).permit(:tytul, :gatunek, :autor, :image)
      end
  end