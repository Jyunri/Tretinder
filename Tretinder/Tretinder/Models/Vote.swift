//
//  Vote.swift
//  Tretinder
//
//  Created by Jimy Suenaga on 13/01/18.
//  Copyright © 2018 Jimysses. All rights reserved.
//

import Foundation

class Vote{
    var id = 0
    var brawl_id = 0
    var user_id = 0
    var choosen_side = ""
    var choosen_player_id = 0
    
    init(id:Int, brawl_id:Int, user_id:Int, choosen_side:String, choosen_player_id:Int){
        self.id = id
        self.brawl_id = brawl_id
        self.user_id = user_id
        self.choosen_side = choosen_side
        self.choosen_player_id = choosen_player_id
    }
}
