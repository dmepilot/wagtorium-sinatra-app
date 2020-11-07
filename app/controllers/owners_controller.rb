class OwnersController < ApplicationController

    get '/login' do
        erb :'/owners/login'
    end

    post '/login' do
        owner=Owner.find_by(:email => params[:email])
        if owner && owner.authenticate(params[:password])
            session[:owner_id]=owner.id
            # redirect '/owners/index'
            redirect to("/owners/#{owner.slug}")

        else
            redirect to("/login")
        end
    end

    get '/signup' do
        erb :'/owners/signup'
    end

    post '/signup' do
        owner=Owner.new(:name => params[:name], :email => params[:email], :phone => params[:phone], :password => params[:password])
        owner.save
        session[:owner_id]=owner.id
        # binding.pry
        # erb :'/owners/index'
        redirect to("/owners/#{owner.slug}")
    end

    get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
    end

    get '/owners/index' do
        erb :'/owners/index'
        # binding.pry
    end

    get '/owners/:slug' do
        @owner = Owner.find_by_slug(params[:slug])
        erb :'/owners/show'
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