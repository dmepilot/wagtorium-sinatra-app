
class AppointmentsController < ApplicationController
    

    get "/appointments" do
        erb :'/appointments/index'
   end

   post "/appointments" do
        if params[:appointment] != nil && params[:dog] != nil
        appt=Appointment.find_by(:id => params[:appointment])
        appt.owner_id = current_owner.id
        appt.dog_id = params[:dog]
        appt.save
        # binding.pry
        redirect "/owners/#{current_owner.slug}"
        else
        redirect "/appointments"
        end
   end
   
    get "/appointments/new" do
        if current_owner.name=="Wagtorium Manager"
            erb :"/appointments/new"
        else
            erb :"/owners/show"
        end
    end

    post "/appointments/new" do
        date=Appointment.convert_date_time(params[:appointments][:date_time])
        new_appt=Appointment.new(:date_time => "#{date}")
        new_appt.save
        #binding.pry
        flash[:new_appt]="Successfully created new appointment on #{new_appt.date_time}."
        redirect "/appointments/new"
    end
  
  
    patch "/appointments/edit" do
        appt=Appointment.find_by(:id => params[:appointment])
        appt.owner_id=nil
        appt.dog_id=nil
        appt.save
        redirect("/owners/#{current_owner.slug}")
    end

end