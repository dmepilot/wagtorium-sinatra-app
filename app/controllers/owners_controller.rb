class OwnersController < ApplicationController

    get '/login' do
        erb :'/owners/login'
    end

    post '/login' do
        owner=Owner.find_by(:email => params[:email])
        if owner && owner.authenticate(params[:password])
            session[:owner_id]=owner.id
            redirect '/owners/index'
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
        erb :'/owners/index'
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
    end

end