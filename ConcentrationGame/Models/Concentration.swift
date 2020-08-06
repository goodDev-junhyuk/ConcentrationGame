//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by junhyuk on 2020/06/23.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

struct Concentration {
    
    private(set) var cards = [Card]()
    
    // 계산된 속성
    private var indexOfOneAndOnlyFaceUpCard: Int? {
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
    
    mutating func chooseCard(at index: Int) {
        
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                // 카드가 매치 되었는지
                if cards[matchIndex] == cards[index] {
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
        
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): You must have at least one pair of cards.")
        
        
        
        
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
