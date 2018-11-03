class EventsController < ApplicationController

def create
    event = Event.create(params.permit(:user_id, :nombre, :sitio_encuentro, :fecha))
    render json: event, status: :created
end

end
