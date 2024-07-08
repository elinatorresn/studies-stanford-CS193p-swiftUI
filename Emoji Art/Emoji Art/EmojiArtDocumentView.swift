//
//  EmojiArtDocumentView.swift
//  Emoji Art
//
//  Created by Elina Torres on 08/07/24.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    
    @ObservedObject var document: EmojiArtDocument
    
    private let emojis = "👻😱🚀🕸️♥️🔍🧙🏻☠️🕷️🚗🚘🚔🚖🚜🏍️🍭🗒️☔️🌧️🌈❄️🌊🐷🐓🐄🐎🐇🧑🏻‍🌾🌾🐑"
    private let paletteEmojiSize: CGFloat = 40
    
    var body: some View {
        VStack(spacing: 0){
            documentBody
            Color.yellow
            ScrollingEmojis(emojis)
                .font(.system(size: paletteEmojiSize))
                .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
    }
    
    private var documentBody: some View{
        GeometryReader { geometry in
            ZStack{
                Color.white
                //image goes here
                ForEach(document.emojis) { emoji in
                    Text(emoji.string)
                        .font(emoji.font)
                        .position(emoji.position.in(geometry))
                }
            }
        }
    }
}

struct ScrollingEmojis: View{
    let emojis: [String]
    
    init(_ emojis: String){
        self.emojis = emojis.uniqued.map(String.init)
    }
    
    var body: some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(emojis, id: \.self){ emoji in
                        Text(emoji)
                }
            }
        }
    }
}

#Preview {
    EmojiArtDocumentView(document: EmojiArtDocument())
}
