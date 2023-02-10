//
//  SetGameApp.swift
//  SetGame
//
//  Created by Yuki Muto on 2/9/23.
//

import SwiftUI

@main
struct SetGameApp: App {
    let game = SetGame()
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
