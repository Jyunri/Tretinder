//
//  Brawl.swift
//  Tretinder
//
//  Created by Jimy Suenaga on 13/01/18.
//  Copyright © 2018 Jimysses. All rights reserved.
//

import Foundation

class Brawl{
    var id = 0
    var name = ""
    var category = ""
    var left_player_id = 0
    var right_player_id = 0
    var left_vote_count = 0
    var right_vote_count = 0
    var left_bg_color = ""
    var right_bg_color = ""
    var user_id = 0
    var verified = false
    var prize = ""
    
    init(id:Int, name:String, category:String, left_player_id:Int, right_player_id:Int, left_vote_count:Int, right_vote_count:Int, user_id:Int){
        self.id = id
        self.name = name
        self.category = category
        self.left_player_id = left_player_id
        self.right_player_id = right_player_id
        self.left_vote_count = left_vote_count
        self.right_vote_count = right_vote_count
        self.user_id = user_id
    }
}
