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
        AspectVGrid(items: game.model.cards, aspectRatio: 2/3) { card in
                CardView(card: card)
                .padding(3)
        }
        .foregroundColor(.gray)
        .padding()
    }
}


struct CardView: View {
    let card: Set.Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
            RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 3)
            Text("\(card.id)")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame()
        ContentView(game: game)
    }
}
