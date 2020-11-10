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

    get '/dogs/:slug/edit' do
        @dog=Dog.find_by_slug(params[:slug])
        erb :'/dogs/edit'
    end

    patch '/dogs/:slug' do
        @dog = Dog.find_by_slug(params[:slug])
        @dog.update(params[:dog])
        @dog.save
        redirect("/dogs/#{@dog.slug}")
    end

    delete '/dogs/:slug' do
        @dog = Dog.find_by_slug(params[:slug])
        current_owner.appointments.each do |a|
            if a.dog_id == @dog.id
                a.owner_id=nil
                a.dog_id=nil
                a.save
                #binding.pry
            end
        end
        @dog.destroy
        redirect("/owners/#{current_owner.slug}")        
    end
end