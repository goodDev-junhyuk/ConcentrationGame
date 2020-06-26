//
//  MainViewController.swift
//  ConcentrationGame
//
//  Created by junhyuk on 2020/06/09.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"

        }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
            print("cardNumber : \(cardNumber)")

        } else {
            print("카드가 선택되지 않았습니다.")
        }
        
    }
    
    // 새로운 메소드 구현.
    func updateViewFromModel() {
        
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1420004401) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
    }
    
    
    var emojiChoices = ["🎃" ,"👻", "🤡", "🌚", "🐸", "🐔", "🙉", "🐶", "🦉"]
    
    var emoji = [Int: String]()

    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        }
        return "?"
        
    }
    
    

}
