class AppointmentsController < ApplicationController
    
   get "/appointments" do
        erb :'/appointments/index'
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
        year=params[:appointments][:date_time].split(/[\-, \T]/)[0]
        month=params[:appointments][:date_time].split(/[\-, \T]/)[1]
        day=params[:appointments][:date_time].split(/[\-, \T]/)[2]
        time=params[:appointments][:date_time].split(/[\-, \T]/)[3]
        new_appt=Appointment.new(:date_time => "#{convert_month(month)} #{day}, #{year} at #{time}")
        new_appt.save
        #binding.pry
        redirect "/appointments/new"
    end

    def convert_month(month)
        if month == "01"
            "January"
        elsif month =="02"
            "Febraury"
        elsif month =="03"
            "March"
        elsif month =="04"
            "April"
        elsif month =="05"
            "May"
        elsif month == "06"
            "June"
        elsif month == "07"
            "July"
        elsif month == "08"
            "August" 
        elsif month == "09"
            "September" 
        elsif month == "10"
            "October"
        elsif month =="11"
            "November"
        elsif month =="12"
            "December"
        end 
    end
end