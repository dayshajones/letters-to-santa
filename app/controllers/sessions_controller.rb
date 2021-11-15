class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to letters_path
        else
            flash.now.alert = "Invalid email or password"
            render "new"
        end
    end


    def logout
        session.clear
        redirect_to new_user_path
    end
end
