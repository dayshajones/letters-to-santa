class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to root_path
        else
            flash[:error] = "Invalid email or password"
            render "new"
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to login_path
        end
    end


    private

    def auth
        request.env['omniauth.auth']
    end
end
