//
//  EmojiArtDocument.swift
//  Emoji Art
//
//  Created by Elina Torres on 08/07/24.
//

import SwiftUI

class EmojiArtDocument: ObservableObject{
    typealias Emoji = EmojiArt.Emoji
    
    private var emojiArt = EmojiArt()
    
    var emojis: [Emoji]{
        emojiArt.emojis
    }
    
    var background: URL?{
        emojiArt.background
    }
    
    // MARK: Intent(s)
    
    func setBackground(_ url: URL?){
        emojiArt.background = url
    }
}
