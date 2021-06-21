//
//  Card.swift
//  assignment_1
//
//  Created by Chen Shoresh on 15/06/2021.
//

import Foundation

struct Card {
    
    static var idCount = 0
    var isFaceUp = false
    var isMatched = false
    var id : Int
    
    static func makeUniqueId() -> Int{
        idCount += 1
        return idCount
    }
    
    init() {
        self.id = Card.makeUniqueId()
    }
}
