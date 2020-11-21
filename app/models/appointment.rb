class Appointment < ActiveRecord::Base
    belongs_to :owner
    belongs_to :dog

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
        elsif month == "11"
            "November"
        elsif month == "12"
            "December"
        end 
    end

end