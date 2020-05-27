//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by junhyuk on 2020/05/24.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        print("touch Card!")
    }
    
    func flipCard() {
        
        print("메소드")
    }
    


}

