class CommentsController < ApplicationController

    def create
        @books = Book.find(params[:book_id])
        @books.comments.create(comment_params)
        @books.comments.order(created_at DESC)
        redirect_to book_path(@books)
    end

    def destroy
        @comments = Comment.find(params[:id])
        @comments.destroy
        redirect_to books_path(@books)
    end

    private

    def comment_params
        params.require(:comment).permit( :content, :rate, :book_id, :name)
    end

end
