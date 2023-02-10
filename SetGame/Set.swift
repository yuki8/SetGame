//
//  Set.swift
//  SetGame
//
//  Created by Yuki Muto on 2/7/23.
//

import Foundation

enum ThreeKinds: CaseIterable {
    case one
    case two
    case three
}

struct Set {
    // number of card will be determined by 3 ** numberOfTraits typically 4 -> 81 cards
    let numberOfTraits: Int
    var cards: [Card]
    
    init(nuberOfTraits: Int = 3) {
        cards = []
        self.numberOfTraits = nuberOfTraits
        let numberOfCards = Int(pow(Double(3), Double(nuberOfTraits)))
        
        for index in 0..<numberOfCards {
            cards.append(Card(symbol: [], id: index))
        }
        print("number of cards: \(cards.count)")
        for trait in 1...nuberOfTraits {
            addTrait(numberOfRepeats: Int(pow(Double(3), Double(trait))))
        }
        cards = Array(cards.shuffled())
    }
    
    private mutating func addTrait(numberOfRepeats: Int) {
        var index = 0
        while index < cards.count {
            for kind in ThreeKinds.allCases {
                for _ in index..<(index + cards.count / numberOfRepeats) {
                    cards[index].symbol.append(kind)
                    index += 1                    
                }
            }
        }
    }
    
    struct Card: Identifiable {
        var symbol: [ThreeKinds]
        let id: Int
    }
}
