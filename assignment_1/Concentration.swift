//
//  Concentration.swift
//  assignment_1
//
//  Created by Chen Shoresh on 15/06/2021.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneCardFaceUp : Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set (newValue){
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    var flipCount = 0
    
    var score = 0
    
    var seenCards = [Card]()
    
    
    func chooseCard ( at index: Int)-> (Int,Int){
        assert(cards.indices.contains(index),"concentration.chooeCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneCardFaceUp , matchIndex != index{
                // check if card match
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true;
                    cards[index].isMatched = true;
                    score+=2
                } else{
                    if (!seenCards.contains(cards[index])){
                        seenCards.append(cards[index])
                    }else{
                        score -= 1
                    }
                    if (!seenCards.contains(cards[matchIndex])){
                        seenCards.append(cards[matchIndex])
                    }else{
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
            } else {

                indexOfOneCardFaceUp = index

            }
            flipCount+=1
           
        }
        
        return (flipCount,score)
    }
    
    init (numberOfMatchingCards:Int){
        assert(numberOfMatchingCards>0,"concentration.init(nunmberOfPairs: \(numberOfMatchingCards)): you must have at least one pair of cards")
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


extension Collection {
    var oneAndOnly : Element? {
    return count == 1 ? first : nil
    }
}
