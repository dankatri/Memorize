//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dan Katri on 12/06/2020.
//  Copyright © 2020 Dan Katri. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "🧟‍♂️", "💀"]
            return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2 ..< 5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    //MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}

