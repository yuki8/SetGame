//
//  ContentView.swift
//  SetGame
//
//  Created by Yuki Muto on 2/6/23.
//

import SwiftUI

struct ContentView: View {
    var game: SetGame
    var body: some View {
        VStack {
            AspectVGrid(items: game.model.cardsOnBoard, aspectRatio: 2/3) { card in
                CardView(card: card, game: game)
                    .padding(3)
            }
            .foregroundColor(.gray)
            .padding()
            if game.model.testSet(card1: game.model.cards[0], card2: game.model.cards[1], card3: game.model.cards[2]) {
                Text("true").foregroundColor(.red)
            } else {
                Text("False").foregroundColor(.red)
            }
        }
    }
}


struct CardView: View {
    let card: Set.Card
    let game: SetGame
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
            RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 3)
            
            getSymbol()
        }
    }
    
    @ViewBuilder
    private func getSymbol() -> some View {
        GeometryReader( content: { geometry in
            game.getShapes(card: card, geometry: geometry)
//            HStack {
//                Spacer()
//                game.getShape(card: card, geometry: geometry)
//                    .foregroundColor(game.getColor(card: card))
//                game.getShape(card: card, geometry: geometry)
//                    .foregroundColor(game.getColor(card: card))
//                game.getShape(card: card, geometry: geometry)
//                    .foregroundColor(game.getColor(card: card))
//                Spacer()
//            }
        })
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame()
        ContentView(game: game)
    }
}
