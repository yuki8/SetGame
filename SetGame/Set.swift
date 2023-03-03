//
//  Set.swift
//  SetGame
//      Only works when the number of traits are between 2(9 cards) to 4(standard 81 cards)
//  Created by Yuki Muto on 2/7/23.
//

import Foundation

enum ThreeKinds: Int, CaseIterable {
    case one = 1
    case two
    case three
}

struct Set {
    let numberOfTraits: Int
    var cards: [Card]
    var cardsOnBoard: [Card]
    
    init(nuberOfTraits: Int = 4) {
        cards = []
        cardsOnBoard = []
        var initialNumberOfCardsOnBoard: Int
        // Make sure numberOfTraits is at least 2 and less than 4 for proper working of game
        if nuberOfTraits < 2 {
            self.numberOfTraits = 2
        } else if nuberOfTraits > 4 {
            self.numberOfTraits = 4
        } else {
            self.numberOfTraits = nuberOfTraits
        }
        // number of card will be determined by 3 ** numberOfTraits typically 4 -> 81 cards
        let numberOfCards = Int(pow(Double(3), Double(self.numberOfTraits)))
        for index in 0..<numberOfCards {
            cards.append(Card(symbol: [], id: index))
        }
        // All combination of given traits(colors, shapes, etc.) are created here
        for trait in 1...self.numberOfTraits {
            addTrait(numberOfRepeats: Int(pow(Double(3), Double(trait))))
        }
        cards = Array(cards.shuffled())
        
        if cards.count < 12 {
            initialNumberOfCardsOnBoard = 9
        } else {
            initialNumberOfCardsOnBoard = 12
        }
       
        for index in 0..<initialNumberOfCardsOnBoard{
            if index < cards.count {
                cardsOnBoard.append(cards[index])
            }
        }
    }
    
    // Depending on the position of the array symbol, "kinds" are distrubuted combinatorically
    // ex. [one, one, one, ...] -- called by init function
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
    
    func testSet(card1:Card, card2:Card, card3:Card) -> Bool {
        print(card1, card2, card3)
        for index in 0..<numberOfTraits {
            if (card1.symbol[index] == card2.symbol[index] && card1.symbol[index] == card3.symbol[index]) ||
                (card1.symbol[index] != card2.symbol[index] && card1.symbol[index] != card3.symbol[index]
                 && card2.symbol[index] != card3.symbol[index]) {
            } else {
                return false
            }
        }
        return true
    }
    
    
    struct Card: Identifiable {
        var symbol: [ThreeKinds]
        var isMatched = false
        let id: Int
    }
}
