class Show <  ApplicationHash
    
    include ActiveHash::Associations

    fields :id, :utc_name


    add id: 1 , utc_name: 'Australia/Melbourne'
    add id: 2 , utc_name: 'Asia/Tokyo'
    add id: 3 , utc_name: 'Europe/London'
    
end