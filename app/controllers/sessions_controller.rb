class SessionsController < ApplicationController

    def new

    end

    def create
        blogger = Blogger.find_by(name: params[:name])

        if blogger
            session[:blogger_id] = blogger.id
            redirect_to blogger, notice: "Welcome back #{blogger.name}"
        else
            flash.now[:alert] = "Invalid Account!"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session[:blogger_id] = nil

        redirect_to movies_path, status: :see_other, notice: "You have successfully signed out!"
    end
end
