class SpicesController < ApplicationController
    def index
        render json: Spice.all, status: :ok
    end

    def show
        spice = find_spice
        render json: spice, status: :ok
    end

    def create
        render json: Spice.create(spice_params), status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end
end
