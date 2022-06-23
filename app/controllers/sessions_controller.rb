class SessionsController < ApplicationController
    $curent_user
    def index
        $current_user
        flash[:alert] = ""
        render "index"
    end

    def create
        username = params[:username]
        password = params[:password]
        user = User.find_by(:username => username)
        if user && user.password_digest == password
           $current_user = user.id
            render "orders/orderhistory"
        else
            flash[:alert] = "Wrong Credentials"
            render "index"
        end 
        
        
    end

    def logintype1

        render "logintype" 
    end

    def adminlogin
        flash[:alert] = ""
        render "adminlogin"
    end

    def checkadminlogin
        username = params[:username]
        password = params[:password]
        # username = username.downcase

        if username=="madhu" && password=="madhu2111"
            $current_user
           
            render "orders/adminhistory"
        else
            flash[:alert] = "Wrong Credentials"
            render "adminlogin"
        end
    end



    def destroy
    end
end
