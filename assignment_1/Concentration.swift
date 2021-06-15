//
//  Concentration.swift
//  assignment_1
//
//  Created by Chen Shoresh on 15/06/2021.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    var indexOfOneCardFaceUp : Int?
    
    func chooseCard ( at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneCardFaceUp , matchIndex != index{
                // check if card match
                if cards[matchIndex].id == cards[index].id{
                    cards[matchIndex].isMatched = true;
                    cards[index].isMatched = true;
                }
                cards[index].isFaceUp = true
                indexOfOneCardFaceUp = nil
            }else {
                for flipIndex in cards.indices{
                    cards[flipIndex].isFaceUp = false
                }
                cards [ index].isFaceUp = true
                indexOfOneCardFaceUp = index
                
            }
        }
    }
    
    init (numberOfMatchingCards:Int){
        for _ in 0...numberOfMatchingCards{
            let card = Card()
            cards += [card,card]
        }
        // shuffle the cards
    }
}
