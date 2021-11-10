class CommentBooksController < ApplicationController

	before_action :authenticate_user!
	def create
        book = Book.find(params[:comment_book][:book_id])
        comment = book.comment_books.build(comment_params)
        comment.user = current_user

        if comment.save
            redirect_to comment.book
        end
    end

	private
        def comment_params
            params.require(:comment_book).permit(:body)
        end
end
