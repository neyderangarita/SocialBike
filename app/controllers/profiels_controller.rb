class ProfielsController < ApplicationController

    # consultar los del perfil
    def show
        profile = Profile.find(params[:id])
        json_response profile
    end

    # Actualizar datos del perfil
    def update    
        profile = Profile.find(params[:id])
        profile.update(profile_params)
        render json: profile, status: :created        
    end

    private

    def profile_params
        params.permit(:email, :fecnac, :name)
    end

end