class SessionController < ApplicationController

    get '/login' do
        erb :'sessions/login'
        #binding.pry
    end

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        @user = User.new(name: params["name"], email: params["email"], password: params["password"])
        @user.save
        session[:user_id] = @user.id
        redirect '/login'
        #binding.pry

    end

    post '/login' do
        @user = User.find_by(email:params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/recipes'

        else
            redirect '/login'
        end
    end

   


end
