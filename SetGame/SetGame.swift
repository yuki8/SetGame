//
//  SetGame.swift
//  SetGame
//
//  Created by Yuki Muto on 2/9/23.
//

import SwiftUI

class SetGame : ObservableObject {
    let colors = [Color.red, Color.green, Color.purple]
    let numbers = [1, 2, 3]
    @Published var model = Set(nuberOfTraits: SetGameConstants.numberOfTraits)
    
    func getNumber(card: Set.Card) -> Int {
        return card.symbol[0].rawValue
    }
    
    @ViewBuilder
    func getShapes(card: Set.Card, geometry: GeometryProxy) -> some View {
        if getNumber(card: card) == 1 {
            getShape(card: card, geometry: geometry)
        } else if getNumber(card: card) == 2 {
            VStack {
                Spacer()
                getShape(card: card, geometry: geometry)
                Spacer(minLength: 0)
                getShape(card: card, geometry: geometry)
                Spacer()
            }
        } else if getNumber(card: card) == 3 {
            VStack {
                Spacer()
                getShape(card: card, geometry: geometry)
                getShape(card: card, geometry: geometry)
                getShape(card: card, geometry: geometry)
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    func getShape(card: Set.Card, geometry: GeometryProxy) -> some View {
        switch card.symbol[1] {
        case .one:
            if card.symbol.count > 3 {
                switch card.symbol[3] {
                case .one:
                    Diamond(geometry: geometry).stroke(lineWidth: 3).foregroundColor(getColor(card: card))//.padding()
                case .two:
                    Diamond(geometry: geometry).foregroundColor(getColor(card: card)).opacity(0.5)
                case .three:
                    Diamond(geometry: geometry).foregroundColor(getColor(card: card))
                }
            } else {
                Diamond(geometry: geometry).foregroundColor(getColor(card: card))
            }
        case .two:
            if card.symbol.count > 3 {
                switch card.symbol[3] {
                case .one:
                    Oval(geometry: geometry).stroke(lineWidth: 3).foregroundColor(getColor(card: card))//.padding()
                case .two:
                    Oval(geometry: geometry).foregroundColor(getColor(card: card)).opacity(0.5)
                case .three:
                    Oval(geometry: geometry).foregroundColor(getColor(card: card))
                }
            } else {
                Oval(geometry: geometry).foregroundColor(getColor(card: card))
            }
        case .three:
            if card.symbol.count > 3 {
                switch card.symbol[3] {
                case .one:
                    Squiggle(geometry: geometry).stroke(lineWidth: 3).foregroundColor(getColor(card: card))//.padding()
                case .two:
                    Squiggle(geometry: geometry).foregroundColor(getColor(card: card)).opacity(0.5)
                case .three:
                    Squiggle(geometry: geometry).foregroundColor(getColor(card: card))
                }
            } else {
                Squiggle(geometry: geometry).foregroundColor(getColor(card: card))
            }
        }
    }
    
    func getColor(card: Set.Card) -> Color {
        if card.symbol.count > 2  {
            switch card.symbol[2] {
            case .one:
                return colors[0]
            case .two:
                return colors[1]
            case .three:
                return colors[2]
            }
        } else {
            return Color.black
        }
    }
    
    // MARK: - Intents
    
    func newGame() {
        model = Set(nuberOfTraits: SetGameConstants.numberOfTraits)
    }
    
    func choose(card : Set.Card) {
        model.choose(card: card)
    }
    
    private struct SetGameConstants {
        static let numberOfTraits = 4
        
    }
}
