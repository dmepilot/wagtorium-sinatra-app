class OwnersController < ApplicationController

    get '/login' do
        # binding.pry
        erb :'/owners/login'
    end

    post '/login' do
        owner=Owner.find_by(:email => params[:email])
        if owner && owner.authenticate(params[:password])
            session[:owner_id]=owner.id
            flash[:success]="Successfully signed in as #{owner.name}."
            redirect to("/owners/#{owner.slug}")

        else
            flash[:error]="Invalid Login" 
            redirect to("/login")
        end
    end

    get '/signup' do
        if !logged_in?
            erb :'/owners/signup'
        else
            redirect to("/owners/#{current_owner.slug}")
        end
    end

    post '/signup' do
        unless Owner.find_by(:email => params[:email]) || Owner.find_by(:name => params[:name])
          owner=Owner.new(:name => params[:name], :email => params[:email], :phone => params[:phone], :password => params[:password])
          if owner.save 
            session[:owner_id]=owner.id
            redirect to("/owners/#{owner.slug}")
          else
            flash[:incomplete]="Please fill in all fields" 
            redirect to "/signup"
         end
        else
          flash[:taken]="Username or Email already in use" 
          redirect to "/signup"
        end
    end

    get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
    end

    get '/owners' do
        erb :'/owners/index'
        # binding.pry
    end

    get '/owners/:slug' do
        if logged_in?
        @owner = Owner.find_by_slug(params[:slug])
        erb :'/owners/show'
        else
            redirect "/login"
        end
    end

    get '/owners/:slug/edit' do
        @owner=Owner.find_by_slug(params[:slug])
        erb :'/owners/edit'
    end

    patch '/owners/:slug' do
        @owner = Owner.find_by_slug(params[:slug])
        @owner.update(params[:owner])
        @owner.dog_ids = params[:dogs]
        @owner.save
        redirect("/owners/#{@owner.slug}")
    end

end