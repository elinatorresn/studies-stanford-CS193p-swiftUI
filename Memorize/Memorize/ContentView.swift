//
//  ContentView.swift
//  Memorize
//
//  Created by Elina Torres on 03/06/24.
//

import SwiftUI //em todos os arquivos que tem UI (tela) tem q ser importado o swiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "💀", "🍭", "😱", "😈", "🧙🏻", "👹", "🕸️", "🙀", "☠️"]
    
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true //se deixar como let isFaceUp não pode mudar entre false and true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12) //type inference
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
