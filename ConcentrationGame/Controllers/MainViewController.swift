//
//  MainViewController.swift
//  ConcentrationGame
//
//  Created by junhyuk on 2020/06/09.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
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
        let cardNumber = cardButtons.index(of: sender)
        print("cardNumber : \(cardNumber)")
        
    }
    
    // 메소드 구현.
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji))")
        
        if button.currentTitle == emoji {
            
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        } else {
            
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        
        
    }
    

}
