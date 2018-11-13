class UsersController < ApplicationController

    # Crear usuario y perfil
    skip_before_action :authorize_request, only: :create
    def create
        user = User.create(params.permit(:username, :password))
        profile = Profile.new(profile_params)
        profile.user = user
        profile.save
        
        # Retornar el mensaje de usuario creado exitosamente
        auth_token = AuthenticateUser.new(user.username, user.password).call
        response = { message: Message.account_created, auth_token: auth_token }
        json_response(response, :created)
    end
    
    # Confirmar asistencia de usuario a evento
    def assist
        event = Event.find(params[:idEvent])
        user = User.find(params[:id])
        event.users << user
        
        render json: event.users, status: :ok    
    end

    # Cancelar asistencia de usuario a evento    
    def cancel_assist
        event = Event.find(params[:idEvent])
        user = User.find(params[:id])
        event.users.delete(user)

        render json: event.users, status: :ok  
    end

    def show_assist
        events = Event.includes(:users).where(users: { id: params[:id]})
        render json: events, status: :ok
    end
    
    private
   
    def profile_params
        params.permit(:email, :fecnac, :name)
    end
   
end
