class Plant < ApplicationRecord
    def index
        plants = Plant.all
        render json: plants
      end
    
      # POST /birds
      def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
      end
    
      # other controller actions here
    # GET /birds/:id
    def show
      plant = Plant.find_by(id: params[:id])
      if plant
        render json: plant
      else
        render json: { error: "Plant not found" }, status: :not_found
      end
    end
      private
      # all methods below here are private
    
      def plant_params
        params.permit(:name, :species)
      end
end
