//
//  ContentView.swift
//  Memorize
//
//  Created by Elina Torres on 03/06/24.
//

import SwiftUI //em todos os arquivos que tem UI (tela) tem q ser importado o swiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "💀", "🍭", "😱", "😈", "🧙🏻", "👹", "🕸️", "🙀", "☠️"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            cards
            cardCountAdjuster
        }
        .padding()
    }
    
    var cardCountAdjuster: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        HStack{
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }.foregroundColor(.orange)
        
    }

    var cardRemover: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
    var cardAdder: some View{
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        }).imageScale(.large)
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
