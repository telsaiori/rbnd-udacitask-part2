module Listable
    
    def format_description(description)
    "#{description}".ljust(30)
    end
    
    def format_date(option = {})
        if option[:start_date] || option[:end_date]
            dates = option[:start_date].strftime("%D") if option[:start_date]
            dates << " -- " + option[:end_date].strftime("%D") if option[:end_date]
            dates = "N/A" if !dates
            dates
        else
            option[:due] ? option[:due].strftime("%D") : "No due date"
        end
    end
    
    def format_priority(priority)
        value = " ⇧".colorize(:red) if priority == "high"
        value = " ⇨" .colorize(:light_blue)if priority == "medium"
        value = " ⇩".colorize(:blue) if priority == "low"
        value = "" if !priority
        return value
    end
    

end
