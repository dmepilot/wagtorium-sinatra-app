class AppointmentsController < ApplicationController

   get "/appointments" do
        erb :'/appointments/show'
   end

   post "/appointments" do
        
        appt=Appointment.find_by(:id => params[:appointment])
        appt.owner_id = current_owner.id
        appt.dog_id = params[:dog]
        appt.save
        # binding.pry
   end
   
    get "/appointments/new" do
        if current_owner.name=="Wagtorium Manager"
            erb :"/appointments/new"
        else
            erb :"/owners/show"
        end
    end

    post "/appointments/new" do
        new_appt=Appointment.create(:date_time =>  params[:appointments])
        # binding.pry
    end
end