//
//  Card.swift
//  assignment_1
//
//  Created by Chen Shoresh on 15/06/2021.
//

import Foundation

struct Card: Hashable{
    
    var hashValue: Int {return id}
    static func ==(lhs: Card, rhs: Card)-> Bool{
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }
    
    private static var idCount = 0
    var isFaceUp = false
    var isMatched = false
    private var id : Int
    
    private static func UniqueIDMaker() -> Int{
        idCount += 1
        return idCount
    }
    
    init() {
        self.id = Card.UniqueIDMaker()
    }
}
