class UsersController < ApplicationController
    def index
        render json: {
            users: User.all
        }
    end

    def create
        console.log(params)
        user = User.new(
            username: params["user"]["username"], 
            email: params["user"]["email"]
        )


        if user.save
            render json: {
                user: user
            }, status: 200
        else
            render json: {
                error: 'user.errors.full_messages'},
                status: 422
            
        end
        
    end
    # create
    # read
    # update
    # destroy
end
#