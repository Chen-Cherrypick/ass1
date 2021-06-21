//
//  Concentration.swift
//  assignment_1
//
//  Created by Chen Shoresh on 15/06/2021.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneCardFaceUp : Int?
    
    var flipCount = 0
    
    var score = 0
    
    var seenCards = [Int]()
    
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneCardFaceUp , matchIndex != index{
                checkIfTwoCardsMatched(card1: matchIndex, newCard: index)
            } else {
                for flipIndex in cards.indices{
                    cards[flipIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneCardFaceUp = index
            }
            flipCount+=1
        }
    }
    
    func checkIfTwoCardsMatched(card1 index1 : Int, newCard index2 : Int){
        if cards[index1].id == cards[index2].id{
            cards[index1].isMatched = true;
            cards[index2].isMatched = true;
            score+=2
        } else{
            if (!seenCards.contains(cards[index2].id)){
                seenCards.append(cards[index2].id)
            } else {
                score -= 1
            }
            if (!seenCards.contains(cards[index1].id)){
                seenCards.append(cards[index1].id)
            } else {
                score -= 1
            }
        }
        cards[index2].isFaceUp = true
        indexOfOneCardFaceUp = nil
    }
    
    
    init(numberOfPairsOfCards: Int){
        for _ in 0...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
    
}
