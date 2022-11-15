class DestinationsController < ApplicationController


    def index
        @destination = Destionation.send(destinations_filter)
    end

    def show
        @destination = Destination.find(params[:id])

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

    end

    def destroy

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
end