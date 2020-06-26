//
//  Card.swift
//  ConcentrationGame
//
//  Created by junhyuk on 2020/06/23.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import Foundation

// 구조체: 상속X, 값 타입.
struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    
    static var identifierFactory = 0
    
    // 정적함수(?)
    static func getUniqueIdentifier() -> Int {
        
        Card.identifierFactory += 1
        return Card.identifierFactory
        
    }
    
    init(identifier: Int) {
        
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
}