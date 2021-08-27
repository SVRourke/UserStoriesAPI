class UsersController < ApplicationController
    def index
        render json: {
            users: User.all
        }
    end

    def create
        puts params.user
    end
    # create
    # read
    # update
    # destroy
end
#