class DogsController < ApplicationController

    get '/dogs/new' do
        erb :'/dogs/new'
    end

    post '/dogs/new' do
        new_dog=Dog.new(params[:dog])
        new_dog.owner_id=current_owner.id
        if new_dog.save
          erb :'/owners/show'
        else
          flash[:incomplete]="Please fill in all fields" 
          redirect '/dogs/new'
        end
    end

    get '/dogs/:id/edit' do
        @dog=Dog.find_by_id(params[:id])
        if @dog.owner_id == current_owner.id
            #binding.pry
            erb :'/dogs/edit'
        else
            redirect to("/owners/#{current_owner.slug}")
        end
    end

    patch '/dogs/:id' do
        @dog = Dog.find_by_id(params[:id])
        @dog.update(params[:dog])
        redirect("/dogs/#{@dog.id}")
    end
    
    delete '/dogs/:id' do
        @dog = Dog.find_by_id(params[:id])
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