class CampersController < ApplicationController


    def index
        campers = Camper.all 
        if campers
        render json: campers
        else 
        render json: {error: "Camper not found"}, status: :not_found
        end
    end
    def show
        camper = Camper.find_by(id: params[:id])
        if camper
        render json: camper, serializer: CamperwithactivitiesSerializer
        else  
            render json: {error: "Camper not found"}, status: :not_found
        end
    end
    def create
        newCamper = Camper.create(name: params[:name], age: params[:age])
        if newCamper.valid?
            render json: newCamper, status: 201
        else
            render json: {errors:["validation errors"] }, status: 422
        end
    end

    private

 
end
