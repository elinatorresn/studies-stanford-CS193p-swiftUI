//
//  EmojiArt.swift
//  Emoji Art
//
//  Created by Elina Torres on 08/07/24.
//

import Foundation

struct EmojiArt{
    var background: URL?
    var emojis = [Emoji]()
    
    struct Emoji{
        let string: String
        var position: Position
        var size: Int
        
        struct Position{
            var x: Int
            var y: Int
        }
    }
}
