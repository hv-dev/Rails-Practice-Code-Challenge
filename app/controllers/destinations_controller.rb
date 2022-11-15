class DestinationsController < ApplicationController


    def index
        @destinations = Destination.send(destinations_filter)
    end

    def show
        @destination = Destination.find(params[:id])
        #@featured_post = @destination.featured
        # ^^ potential other way of doing scope for a specific destination, could also be used for bloggers and posts
        @featured_post = Destination.featured(@destination.id)
        @recent = Destination.recent(@destination.id)
    end

    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)

        if @destination.save
            redirect_to @destination, notice: "Destination succesffuly created"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @destination.update(destination_params)
            redirect_to @destination, notice: "Destination updated successfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @destionation.destroy
        redirect_to destionations_path, status: :see_other, alert: "Destination successfully deleted"
    end

    private

    def destination_params
        params.require(:destination).permit(
            :name,
            :country
        )
    end

    def destinations_filter
        if params[:filter].in? %w(all)
            params[:filter]
        else
            :list
       end
    end
end