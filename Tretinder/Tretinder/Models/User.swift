//
//  User.swift
//  Tretinder
//
//  Created by Jimy Suenaga on 13/01/18.
//  Copyright © 2018 Jimysses. All rights reserved.
//

import Foundation

class User{
    var id = 0
    var name = ""
    var last_name = ""
    var password = ""
    var role = ""
    
    init(id:Int, name:String, last_name:String){
        self.id = id
        self.name = name
        self.last_name = last_name
    }
}
