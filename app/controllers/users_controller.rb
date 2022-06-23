class UsersController < ApplicationController
    def index
        flash[:alert] = ""
        render "index"
    end

    def welcome
        render "welcome"
    end

    def create
        email=params[:username]
        password=params[:password]
        username =params[:username1]
        user = User.find_by(:email=>email)
        user1 = User.find_by(:username=>username)
   
        if user
            
            flash[:alert] = "Email already taken"
            
            render "index"
        elsif user1
            flash[:alert] = "Username already taken"
            render "index"
        elsif password!=params[:confirmpassword]
            
            flash[:alert] = "Check for password"
            render "index"
        else
            User.create(
                :email => email,
                :password_digest => password,
                :username => username
            )
            render "sessions/index"
            
        end
       
    end
     
    def destroy
    end
end
