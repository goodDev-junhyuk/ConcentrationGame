//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by junhyuk on 2020/06/23.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                // 카드가 매치 되었는지
                if cards[matchIndex].identifier == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
            } else {
                
                //
                
            }
            
        }
        
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//
//        } else {
//            cards[index].isFaceUp = true
//
//        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for identifier in 1...numberOfPairsOfCards {
            let card = Card(identifier: identifier)
            cards += [card, card]
        }
        
        // ShuffleCard
    }
}
