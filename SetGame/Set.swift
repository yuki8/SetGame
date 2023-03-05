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
    private var numberOfMatch = 0
    private var indexTopDeck = 0
    var cards: [Card]
    var cardsOnBoard: [Card]
    var numberOfSelectedCards : Int {
        get {
            var count = 0
            for card in cardsOnBoard {
                if card.isSelected {
                    count += 1
                }
            }
            return count
        }
    }
    
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
            indexTopDeck = 9
        } else {
            initialNumberOfCardsOnBoard = 12
            indexTopDeck = 12
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
    
    mutating func choose(card: Card) {
        for index in 0..<cardsOnBoard.count {
            if numberOfSelectedCards < 3 && card.id == cardsOnBoard[index].id {
                cardsOnBoard[index].isSelected.toggle()
            }
        }
        if numberOfSelectedCards == 3 {
            let cardsTested = cardsOnBoard.filter { card in
                card.isSelected
            }
            if cardsTested.count == 3 {
                if testSet(card1: cardsTested[0], card2: cardsTested[1], card3: cardsTested[2]) {
                    numberOfMatch += 1
                    for card in cardsTested {
                        let indexReplace = cardsOnBoard.firstIndex(where: {card.id == $0.id})!
                        print(indexReplace)
                        cardsOnBoard.remove(at: indexReplace)
                        if indexTopDeck < cards.count {
                            cardsOnBoard.insert(cards[indexTopDeck], at: indexReplace)
                            indexTopDeck += 1
                            print(indexTopDeck)
                        }
                    }
                } else {
                    for index in cardsOnBoard.indices {
                        cardsOnBoard[index].isSelected = false
                    }
                }
            }
        }
    }
    
    private func testSet(card1:Card, card2:Card, card3:Card) -> Bool {
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
    
    func isDeckEmpty() -> Bool {
        if indexTopDeck < cards.count {
            return false
        }
        return true
    }
    
    mutating func dealCards() {
        for _ in 0..<3 {
            cardsOnBoard.append(cards[indexTopDeck])
            indexTopDeck += 1
        }
    }
    
    struct Card: Identifiable {
        var symbol: [ThreeKinds]
        var isMatched = false
        var isSelected = false
        let id: Int
    }
}
