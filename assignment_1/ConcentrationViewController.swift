//
//  ViewController.swift
//  assignment_1
//
//  Created by Chen Shoresh on 15/06/2021.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButton.count+1)/2)
    
    @IBOutlet weak var countFlipsLabel: UILabel!
    
    var counterFlips = 0 {
        didSet {
            countFlipsLabel.text = "Flips: \(counterFlips)"
        }
    }
    
    var score = 0 {
        didSet {
            scoreLbl.text = "Score: \(score)"
        }
    }
    
    
    lazy var themeChoice = Int(arc4random_uniform(UInt32(emojiChoices.count)))
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet var cardButton: [UIButton]!
    
    @IBAction func cardClicked(_ sender: UIButton) {
        if let cardNumber = cardButton.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            counterFlips  = game.flipCount
            score = game.score
            updateViewFromModel()
        }
        
    }
    
    func updateViewFromModel(){
        for index in cardButton.indices{
            let button = cardButton[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.8903092742, green: 0.7925885916, blue: 0.7986693978, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 0.8590755463, green: 1, blue: 0.5956398249, alpha: 0) :  #colorLiteral(red: 1, green: 0.9017891288, blue: 0.903757751, alpha: 1)
            }
        }
    }
    
    
    lazy var emojiChoices = [foodEmoji,animalEmoji,facesEmoji,flagEmoji,carsEmoji,clothesEmoji]
    var  emoji = [Int:String]()
    
    
    var foodEmoji = ["🍔","🍟","🍕","🥗","🌯","🍜","🥟","🍤","🍦","🍫","🍿","🍪","🥠","🥘","🧀"]
    var animalEmoji = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐮","🦁","🐸","🐵","🐨","🐧"]
    var facesEmoji = ["😍","🤪","😎","🥸","🥳","🤓","🤩","😡","🥶","😱","🤯","😶","😴","😷","🤑"]
    var flagEmoji = ["🇮🇱","🇱🇷","🇳🇮","🇳🇿","🇿🇦","🇹🇹","🇺🇸","🇾🇪","🇳🇪","🇱🇮","🇬🇫","🇪🇹","🇬🇵","🇬🇹","🇭🇰"]
    var carsEmoji = ["🚗","🚎","🚒","🚛","🚜","✈️","⛴","🚤","🛴","🦼","🛵","🚲","🛺","🚔","🚠"]
    var clothesEmoji = ["👚","👕","👖","🩳","👠","🩴","👘","👙","🧤","🧦","👒","👜","👗","👢","🥾"]
    
    
    
    func emoji(for card : Card) -> String{
        if emoji[card.id] == nil , emojiChoices.count>0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices[themeChoice].count)))
            emoji[card.id] = emojiChoices[themeChoice].remove(at: randomIndex)
        }
        return emoji[card.id] ?? "🥴"
        
    }
    
    
    @IBAction func restartGameBtn(_ sender: UIButton) {
        counterFlips = 0
        score = 0
        themeChoice = Int(arc4random_uniform(UInt32(emojiChoices.count)))
        game = Concentration(numberOfPairsOfCards: (cardButton.count+1)/2)
        updateViewFromModel()
    }
    
}



