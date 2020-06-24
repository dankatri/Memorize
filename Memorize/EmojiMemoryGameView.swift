//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Dan Katri on 12/06/2020.
//  Copyright © 2020 Dan Katri. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                    self.viewModel.choose(card: card)}
            }
        }
            .foregroundColor(Color.orange)
            .padding()
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content).font(Font.title)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        
        }
        
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: Drawing constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 200
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
