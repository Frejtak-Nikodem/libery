class BooksController < ApplicationController
    before_action :authenticate_user!
  
    def index  
      @books = Book.all
      @comments = Comment.all
    end

    def search
      @q = Book.where(" title LIKE ?", "%#{ params[:q] }%")
    end
  
    def show
      @books = Book.find(params[:id])
      @commnents = Comment.all
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

    def rental
      @rent = Book.find(params[:id])
      @rent.user_id = current_user.id
      @rent.status = true
      if @rent.save
        redirect_to book_path(@rent)
      end
    end

    def unrental
      @unrent = Book.find(params[:id])
      @unrent.user_id = current_user.id
      @unrent.status = false
      if @unrent.save
        redirect_to book_path(@unrent)
      end
    end
  
    private
      def books_params
        params.require(:book).permit(:title, :species, :author_id, :release_date, :image, :user_id, :status)
      end
  end