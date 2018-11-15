class EventsController < ApplicationController

    # Crear evento y retornar el evento creado
    def create
        event = Event.create(params.permit(:user_id, :nombre, :sitio_encuentro, :fecha))
        render json: event, status: :created
    end
    
    # Retornar todos los eventos creados
    def index
        events = Event.all
        render json: events, status: :created
    end
    
    # Retorna todos los eventos creados por un usuario
    def show
        user = User.find(params[:id])
        events = user.created_events
        json_response events
    end

    # Borra un evento creado
    def destroy
        event = Event.find(params[:id])
        event.delete()
        render json: event, status: :ok 
    end

end
