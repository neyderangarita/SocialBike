class RoutesController < ApplicationController

    # Crear comentario a un evento 
    def create
        route = Route.create(params.permit(:event_id, :map, :description))
        render json: route, status: :created        
    end

     # Consultar los comentarios de un evento 
    def index
        event = Event.find(params[:event_id])
        render json: event.route, status: :ok
    end
    
end
