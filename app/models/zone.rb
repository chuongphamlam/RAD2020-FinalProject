class Zone < ApplicationHash
    include ActiveHash::Associations
    belongs_to :show


    fields :id, :value, :abbr, :offset, :isdst, :text, :utc
        data = JSON.parse(File.read("#{Rails.root}/lib/zone.json"))
        data.map do |item|
            add id: Zone.count + 1, value: item["value"], abbr: item["abbr"], offset: item["offset"], isdst: item["isdst"], text: item["text"], utc: item["utc"]
           
        end


      


end