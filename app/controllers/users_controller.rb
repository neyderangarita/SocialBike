class UsersController < ApplicationController
   def create
        user = User.create(user_params)
        render json: user, status: :ok    
   end

    def assist
        event = Event.find(params[:idEvent])
        user = User.find(params[:id])
        event.users << user
        render json: event.users, status: :ok    
    end
    
    

   private
   
   def user_params
        params.permit(:username, :password)
   end
end
