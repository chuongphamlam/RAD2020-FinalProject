class TimesController < ApplicationController
    require 'tzinfo'

    def index
        @datas = Array.new
        Show.all.each do |key|
        utc =  Utc.where( utc_name: key.utc_name)
        zone = Zone.find(utc.first.zone_id)
        tz = TZInfo::Timezone.get(key.utc_name)

        time = Time.now.getlocal(tz.current_period.offset.utc_total_offset)
        formart_time_12 = time.strftime("%I:%M %p") 
        formart_time_24 = time.strftime("%H:%M %p")
        type = formart_time_24.split(":").first
        current_date = time.strftime("%F")
        @datas << { 
                    "id" => key.id,
                    "type" => check_time(type),
                    "offset" => zone.offset,
                    "date" => check(day(current_date), day(date_zone)),
                    "contry" => key.utc_name.split("/").last, 
                    "time_now_12" => formart_time_12, 
                    "time_now_24" => formart_time_24}   
  
        end

    end


    def destroy

        id = request.url.split("?").last
        # Show.find(id).delete   

    end
    

    private


    def date_zone
        time = TZInfo::Timezone.get("Australia/Melbourne")
        time = Time.now.getlocal(time.current_period.offset.utc_total_offset)
        time.strftime("%F")
    end


    def day(date)
        date.split("-").last
    end

    def check(date_zone, current_date)
        if date_zone == date_zone
            date = "Today"
         elsif a > b
            date = "Yesterday"
         else
            date = "Tomorrow"
         end 
             date
    end

    def check_time(condition)
        case condition.to_f
        when 8.9..17.9
         type = "fa fa-circle green"
        when 18..19.9
         type = "fa fa-circle yellow"
        when 8..8.9
          type = "fa fa-circle red"
        when 19.9..22.9
          type = "fa fa-circle red"
        else
          type = "fa fa-moon-o"
        end
        end
end



