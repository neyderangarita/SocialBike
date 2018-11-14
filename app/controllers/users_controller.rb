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
    
    skip_before_action :authorize_request, only: :password_reset
    def password_reset  
        @user_email = params['email']
        @perfil = Profile.find_by(email: @user_email)
        @user = User.find(@perfil.user)  

        if @user
            password_recovery_token = SecureRandom.hex(32)
            @user.password_recovery_token = password_recovery_token
            @user.password_recovery_expiration = Time.now  

            begin
                @user.save!
                #base_url = request.protocol + request.host_with_port
                #ExampleMailer.sample_email(@user, base_url).deliver
                #render json: @user, status: :ok
                #render json: {success: 'request reset password successful'}, status: :ok

            rescue Exception => e
                render json: {error: 'Fail save user with temporal password recovery token'}, status: :internal_server_error
            end

            begin
                #UserMailer.with(user: @user).welcome_email.deliver_now
                UserMailer.welcome_email().deliver

            rescue Exception => e
                render json: {error: e}, status: :internal_server_error
            end

        else
          render json: {error: 'User not found'}, status: :not_found
        end
    end

    private
   
    def profile_params
        params.permit(:email, :fecnac, :name)
    end
   
end
