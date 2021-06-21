//
//  ViewController.swift
//  assignment_1
//
//  Created by Chen Shoresh on 15/06/2021.
//

import UIKit

class ConcentrationViewController: UIViewController {
    

    lazy var game = Concentration(numberOfPairsOfCards: ((cardButton.count+1)/2))

    var numberOfPairs: Int {
        return (cardButton.count+1)/2
    }
    
    @IBOutlet private weak var countFlipsLabel: UILabel! {
        didSet{
            updateFlipsCountLabel()
        }
    }

    
    private(set) var counterFlips = 0 {
        didSet {

            updateFlipsCountLabel()
        }
    }
    
    private func updateFlipsCountLabel() {
        let attributes: [NSAttributedString.Key : Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributeString = NSAttributedString(string: "Flips: \(counterFlips)", attributes: attributes)
        countFlipsLabel.attributedText = attributeString
    }
    
    @IBOutlet private weak var scoreLbl: UILabel! {
        didSet{
            updateScoreLabel()
        }
    }
    
    private(set) var score = 0 {
        didSet{
            updateScoreLabel()
        }
    }
    
    private func updateScoreLabel (){
        let attributesScoreLabel: [NSAttributedString.Key : Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributeString = NSAttributedString(string: "Score: \(score)", attributes: attributesScoreLabel)
        scoreLbl.attributedText = attributeString
    }
    
    
    lazy var themeChoice = Int(arc4random_uniform(UInt32(emojiChoices.count)))
    
    
    @IBOutlet private var cardButton: [UIButton]!
    
    @IBAction func cardClicked(_ sender: UIButton) {
        if let cardNumber = cardButton.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            counterFlips  = game.flipCount
            score = game.score
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButton.indices {
            let button = cardButton[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.8903092742, green: 0.7925885916, blue: 0.7986693978, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 0.8590755463, green: 1, blue: 0.5956398249, alpha: 0) :  #colorLiteral(red: 1, green: 0.9017891288, blue: 0.903757751, alpha: 1)
            }
        }
    }
    
    

    lazy var emojiChoices = [foodEmoji,animalEmoji,facesEmoji,flagEmoji,carsEmoji,clothesEmoji]
    private var  emoji = [Card:String]()

    
    
    private var foodEmoji = ["🍔","🍟","🍕","🥗","🌯","🍜","🥟","🍤","🍦","🍫","🍿","🍪","🥠","🥘","🧀"]
    private var animalEmoji = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐮","🦁","🐸","🐵","🐨","🐧"]
    private var facesEmoji = ["😍","🤪","😎","🥸","🥳","🤓","🤩","😡","🥶","😱","🤯","😶","😴","😷","🤑"]
    private var flagEmoji = ["🇮🇱","🇱🇷","🇳🇮","🇳🇿","🇿🇦","🇹🇹","🇺🇸","🇾🇪","🇳🇪","🇱🇮","🇬🇫","🇪🇹","🇬🇵","🇬🇹","🇭🇰"]
    private var carsEmoji = ["🚗","🚎","🚒","🚛","🚜","✈️","⛴","🚤","🛴","🦼","🛵","🚲","🛺","🚔","🚠"]
    private var clothesEmoji = ["👚","👕","👖","🩳","👠","🩴","👘","👙","🧤","🧦","👒","👜","👗","👢","🥾"]
    
    

    private func emoji(for card: Card) -> String {
        if emoji[card] == nil , emojiChoices[themeChoice].count>0 {
            let randomIndex = emojiChoices[themeChoice].count.arc4random
            emoji[card] = emojiChoices[themeChoice].remove(at: randomIndex)
        }
        return emoji[card] ?? "🥴"
    }
    
    
    @IBAction func restartGameBtn(_ sender: UIButton) {
        counterFlips = 0
        score = 0
        themeChoice = emojiChoices.count.arc4random
        game = Concentration(numberOfPairsOfCards: (cardButton.count+1)/2)
        updateViewFromModel()
    }
}

extension Int {
    var arc4random: Int {
        if self>0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}


