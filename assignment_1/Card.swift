//
//  Card.swift
//  assignment_1
//
//  Created by Chen Shoresh on 15/06/2021.
//

import Foundation

class Card{
    
    static var idCount = 0
    var isFaceUp = false
    var isMatched = false
    var id : Int
    
    static func UniqueIDMaker() -> Int{
        idCount += 1
        return idCount
    }
    
    init() {
        id = Card.UniqueIDMaker()
    }
}
