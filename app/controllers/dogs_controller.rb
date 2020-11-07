class DogsController < ApplicationController

    get '/dogs/new' do
        erb :'/dogs/new'
    end

    post '/dogs/new' do
        new_dog=Dog.create(params[:dog])
        new_dog.owner_id=current_owner.id
        new_dog.save
        erb :'/owners/show'
    end
end