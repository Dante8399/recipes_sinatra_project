class RecipesController < ApplicationController

    #get '/recipes' do
        ##@user = User.find(session[:user_id])
        #@recipes = @user.recipes
      
    #end
    
    get '/recipes' do
        #@recipes = Recipe.all
        if logged_in?
            @user = current_user
        #@recipes = Recipe.where(user_id: session[:user_id])
        @recipes = @user.recipes
        erb :"recipes/index"
        else
            redirect "/login"
        end
    end

    #CREATE new page
    get '/recipes/new' do
        erb :"recipes/new"
    end

    # Shows one particular recipe
    get '/recipes/:id' do
        @recipe = Recipe.find_by_id(params[:id])

        if @recipe
            erb :"recipes/show"
        else
            redirect '/recipes'
        end
    end

    get '/recipes/:id/edit' do
        @recipe = Recipe.find_by_id(params[:id])
        erb :"recipes/edit"    
    
    end

    patch '/recipes/:id' do
        @recipe = Recipe.find_by_id(params[:id])

        if @recipe.update(params[:recipe])
            redirect "/recipes/#{@recipe.id}"
        else
            redirect "/recipes/#{@recipe.id}"
        end
    end

    


    post '/recipes' do
        @recipe = Recipe.new(name:params[:name],description:params[:description],user_id:session[:user_id])
        #binding.pry

        if @recipe.save
            redirect "/recipes/#{@recipe.id}"
        else
            redirect "/recipes/new"
        end
    end

    delete '/recipes/:id'  do
        recipe = Recipe.find_by_id(params[:id])

        if recipe.destroy
            redirect "/recipes"
        else
            redirect "/recipes/#{recipe.id}"
        end
    end

    


end

