//
//  DateJson.swift
//  siege
//
//  Created by oneplay on 2020/11/17.
//  Copyright © 2020 JackPan. All rights reserved.
//

import Foundation

struct  DateJson : Codable{
    var list : [list]
    
    
    
}
struct list :Codable {
    var  districts : [districts]
    var name : String
}
struct districts :Codable {
    var name : String
    var zip :String

}


func get(){

    
}

