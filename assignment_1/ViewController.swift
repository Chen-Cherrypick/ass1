//
//  ViewController.swift
//  assignment_1
//
//  Created by Chen Shoresh on 15/06/2021.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfMatchingCards: (cardsButtons.count+1)/2)
    
    
    @IBOutlet var cardButton: [UIButton]!

    @IBAction func cardClicked(_ sender: UIButton) {
        
    }
    
}



