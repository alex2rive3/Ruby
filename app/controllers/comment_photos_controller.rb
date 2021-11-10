class CommentPhotosController < ApplicationController
	before_action :authenticate_user!
    def create
        photo = Photo.find(params[:comment_photo][:photo_id])
        comment = photo.comment_photos.build(comment_params)
        comment.user = current_user
        if comment.save
            redirect_to comment.photo
        end
    end

    private
    def comment_params
        params.require(:comment_photo).permit(:body)
    end
end
