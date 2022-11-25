class CommentsController < ApplicationController

    def create
        @book = Book.find(params[:book_id])
        @comment = @book.comments.create(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
          redirect_to @book
        else
          flash.now[:danger] = "error"
        end
      end

    def destroy
        @comments = Comment.find(params[:id])
        @comments.destroy
        redirect_to books_path(@books)
    end

    private

    def comment_params
        params.require(:comment).permit( :content, :rate, :book_id)
    end

end
