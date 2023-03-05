//
//  ContentView.swift
//  SetGame
//
//  Created by Yuki Muto on 2/6/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: SetGame
    var body: some View {
        VStack {
            HStack {
                Text("Sets Made:")
                Text("\(game.model.getNumberOfMatches())")
                if game.model.isGameOver() {
                    Text("Game Over").foregroundColor(.red)
                }
            }.font(.title2)
            AspectVGrid(items: game.model.cardsOnBoard, aspectRatio: 2/3) { card in
                CardView(card: card, game: game)
                    .padding(3)
                    .onTapGesture {
                        game.model.choose(card: card)
                    }
            }
            .foregroundColor(.gray)
            .padding(2)
            HStack {
                Spacer()
                // If there is no more cards in deck or there is still a match exist,
                // deal cards button does not work
                if game.model.isDeckEmpty() || game.model.doesMatchExist() {
                    Button("Deal 3 More Cards", action: {
                        game.model.dealCards()
                    })
                    .foregroundColor(.brown)
                    .disabled(true)
                } else {
                    Button("Deal 3 More Cards", action: {
                        game.model.dealCards()
                    })
                    .disabled(false)
                }
                Spacer()
                Button("New Game", action: {
                    game.newGame()
                })
                Spacer()
            }.font(.title2)
        }
    }
}


struct CardView: View {
    let card: Set.Card
    let game: SetGame
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
            if !card.isSelected {
                RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 3)
            } else {
                RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 3).foregroundColor(.red)
            }
            getSymbol()
        }
    }
    
    @ViewBuilder
    private func getSymbol() -> some View {
        GeometryReader( content: { geometry in
            game.getShapes(card: card, geometry: geometry)
        })
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame()
        ContentView(game: game)
    }
}
