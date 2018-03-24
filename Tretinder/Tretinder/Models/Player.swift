//
//  Player.swift
//  Tretinder
//
//  Created by Jimy Suenaga on 13/01/18.
//  Copyright © 2018 Jimysses. All rights reserved.
//

import Foundation


class Player{
    var id = 0
    var name = ""
    var image = ""
    var rating = 0
    var description = ""
    var verified = false
    
    init(id:Int, name:String, image:String, description:String){
        self.id = id
        self.name = name
        self.image = image
        self.description = description
    }
}

class brand : Player{
    var player_id = 0
    var address = ""
    var city = ""
    var state = ""
    var country = ""
    var lat = 0
    var long = 0
    var brand_owner_id = 0
}

class publicImage : Player{
    var player_id = 0
    var full_name = ""
    var activity = ""
}
