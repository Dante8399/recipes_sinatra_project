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

    get '/recipes/search' do
        #@recipe = Recipe.find_by_name(params[:name])
        erb :"recipes/search"
        
        
    end

    post '/recipes/results' do
        
        @recipe = Recipe.find_by_name(params[:name])
        if @recipe
        erb :"recipes/results"
        else 
            redirect '/recipes/search'
        end
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
        if @recipe.ingredients[0]
            @ingredient0 = @recipe.ingredients[0].name
        else
            @ingredient0 = ""
            
        end
        if @recipe.ingredients[1]
            @ingredient1 = @recipe.ingredients[1].name
        else
            @ingredient1 = ""
            
        end
        if @recipe.ingredients[2]
            @ingredient2 = @recipe.ingredients[2].name
        else
            @ingredient2 = ""
            
        end
        erb :"recipes/edit"    
    
    end

    patch '/recipes/:id' do
        
        @recipe = Recipe.find_by_id(params[:id])
        

      

        if @recipe.update(params[:recipe]) || @recipe.ingredients.update(params[:ingredients[0]])
            redirect "/recipes/#{@recipe.id}"
        else
            redirect "/recipes/#{@recipe.id}"
        end
    end

    


    post '/recipes' do
        
        @recipe = Recipe.new(name:params[:name],description:params[:description],user_id:session[:user_id])
        
        
        

        if @recipe.save 
            params[:ingredients].each do |i|
                if i[:name] != ""
                    Ingredient.create(name:i[:name], recipe_id:@recipe.id)
                end
            end
            redirect "/recipes/#{@recipe.id}"
        else
            redirect "/recipes/new"
        end
    end

    post '/recipes/search' do
        
        @recipe = Recipe.find_by_name(params[:name])
        
         erb :"recipes/results"
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

