class CommentsController < ApplicationController

    # Crear comentario a un evento 
    def create
        comment = Comment.create(params.permit(:user_id, :event_id, :comment))
        render json: comment, status: :created        
    end
    
    def index
        event = Event.find(params[:event_id])
        render json: event.comments, status: :ok
    end
end
