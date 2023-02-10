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
            ForEach(game.model.cards) { card in
                Text("\(card.id)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame()
        ContentView(game: game)
    }
}
