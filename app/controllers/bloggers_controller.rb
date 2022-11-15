class BloggersController < ApplicationController

    before_action :require_signin, only: [:edit, :update, :destroy]
    before_action :require_current_blogger, only: [:edit, :update, :destroy]

    def index
        @bloggers = Blogger.send(bloggers_filter)
    end

    def show
        @blogger = Blogger.find(params[:id])
        @featured = Post.bloggers_featured_post(@blogger.id)
        @total_likes = Post.bloggers_total_likes(@blogger.id)
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)

        if @blogger.save
            session[:blogger_id] = @blogger.id
            redirect_to (session[:intended_url] || @blogger), notice: "Welcome #{@blogger.name}"
            session[:intended_url] = nil
        else
            flash.now[:alert] = "Invalid Details"
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @blogger = Blogger.find(params[:id])
    end

    def update
        if @blogger.update(blogger_param)
            redirect_to @blogger, notice: "Blogger succesffuly updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @blogger.destroy
        session[:blogger_id] = nil
        redirect_to root_url, status: :see_other, alert: "Account successfuly deleted!"
    end

    private

    def blogger_params
        params.require(:blogger).permit(
            :name,
            :bio,
            :age
        )
    end

    def require_correct_blogger
        @blogger = blogger.find(params[:id])
        redirect_to root_url, status: :see_other, alert: "You do not have access to that page, redirected to homepage." unless current_blogger?(@blogger)
    end

    def bloggers_filter
        if params[:filter].in? %w(list)
            params[:filter]
        else
            :all
        end
    end
end