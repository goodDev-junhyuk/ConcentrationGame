//
//  MainViewController.swift
//  ConcentrationGame
//
//  Created by junhyuk on 2020/06/09.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var game: Concentration  = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"

        }
    }
    
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
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
    private func updateViewFromModel() {
        
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
    
    var theme: String? {
        
        didSet {
            
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    
    
    private var emojiChoices = ["🎃" ,"👻", "🤡", "🌚", "🐸", "🐔", "🙉", "🐶", "🦉"]
    private var emoji = [Card: String]()

    private func emoji(for card: Card) -> String {
        
        if emoji[card] == nil, emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
        return emoji[card] ?? "?"
        
    }
}

extension Int {
    
    var arc4random: Int {
        
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
