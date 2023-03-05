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
            AspectVGrid(items: game.model.cardsOnBoard, aspectRatio: 2/3) { card in
                CardView(card: card, game: game)
                    .padding(3)
                    .onTapGesture {
                        game.model.choose(card: card)
                    }
            }
            .foregroundColor(.gray)
            .padding(2)
            if game.model.isDeckEmpty() {
                Button("Deal 3 More Cards", action: {
                    game.model.dealCards()
                })
                .foregroundColor(.brown)
                .font(.largeTitle)
                .disabled(true)
            } else {
                Button("Deal 3 More Cards", action: {
                    game.model.dealCards()
                })
                .font(.largeTitle)
                .disabled(false)
            }
            Spacer()
            Button("New Game", action: {
                game.newGame()
            })
                .font(.largeTitle)
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
