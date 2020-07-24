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
    
    // 계산된 속성
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            
            var foundIndex: Int?
            for index in cards.indices {
                
                if cards[index].isFaceUp {
                    
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
                
                
                
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                // 카드가 매치 되었는지
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
                // 2개의 카드가 매치 되지 않았을 때.
            } else {
                indexOfOneAndOnlyFaceUpCard = index
                        
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for identifier in 1...numberOfPairsOfCards {
            let card = Card(identifier: identifier)
            cards += [card, card]
        }
        
        // ShuffleCard, arc4Random_uniform 활용.
        for i in 0...(numberOfPairsOfCards*2)-1 {
            let randomCard = Int(arc4random_uniform(UInt32(numberOfPairsOfCards)))
            cards.swapAt(i, randomCard)
        }
        
    }
}
