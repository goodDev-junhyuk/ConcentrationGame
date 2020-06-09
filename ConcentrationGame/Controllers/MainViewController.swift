//
//  MainViewController.swift
//  ConcentrationGame
//
//  Created by junhyuk on 2020/06/09.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
        print("카드를 탭하였다.")
        
    }
    
    // 메소드 구현.
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        
        if button.currentTitle == emoji {
            
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        } else {
            
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        
        
    }
    

}
