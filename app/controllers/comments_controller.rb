class CommentsController < ApplicationController

    def create
        comment = Comment.create(params.permit(:user_id, :event_id, :comment))
        render json: comment, status: :created        
    end

end
