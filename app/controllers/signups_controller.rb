class SignupsController < ApplicationController
    def create
        signup = Signup.create(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
        if signup.valid?
            activity = Activity.find(signup.activity_id)
            render json: activity, status: 201
        else  
            render json: {errors: ["validation errors"]}, status: 422
        end
    end
end
