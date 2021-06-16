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
    
    var flipCount = 0
    
    var score = 0
    
    var seenCards = [Int]()
    
    
    func chooseCard ( at index: Int)-> (Int,Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneCardFaceUp , matchIndex != index{
                // check if card match
                if cards[matchIndex].id == cards[index].id{
                    cards[matchIndex].isMatched = true;
                    cards[index].isMatched = true;
                    score+=2
                } else{
                    if (!seenCards.contains(cards[index].id)){
                        seenCards.append(cards[index].id)
                    }else{
                        score -= 1
                    }
                    if (!seenCards.contains(cards[matchIndex].id)){
                        seenCards.append(cards[matchIndex].id)
                    }else{
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneCardFaceUp = nil
            } else {
                for flipIndex in cards.indices{
                    cards[flipIndex].isFaceUp = false
                }
//                if (!seenCards.contains(cards[index].id)){
//                    seenCards.append(cards[index].id)
//                }
                cards[index].isFaceUp = true
                indexOfOneCardFaceUp = index

            }
            flipCount+=1
           
        }
        
        return (flipCount,score)
    }
    
    init (numberOfMatchingCards:Int){
        for _ in 0...numberOfMatchingCards{
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
    
    func restartGame (){
        for flipIndex in cards.indices{
            cards[flipIndex].isFaceUp = false
            cards[flipIndex].isMatched = false
        }
    }
}
