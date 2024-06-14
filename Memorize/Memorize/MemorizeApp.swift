//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Elina Torres on 03/06/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
