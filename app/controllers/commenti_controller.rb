class CommentisController < ApplicationController
    def create
        @commenti = Commenti.new(comment_params)
        @commenti.user = current_user
        if @commenti.save
            redirect_to [@commenti.commentable], notice: 'Comment created'
        else
            render :new
        end
    end
    private
    def comment_params
        params.require(:commenti).permit(:username, :message, :commentable_id, :commentable_type)
    end
end