class Utc < ApplicationHash
    include ActiveHash::Associations
    fields :id, :zone_id, :utc_name



    Zone.all.each do |zone|
        zone.utc.each do |utc|
            add id: Utc.count + 1, zone_id: zone.id, utc_name: utc
            end

    end



end