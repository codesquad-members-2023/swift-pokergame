//
//  Dealer.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/22.
//

import Foundation

class Dealer {
    private var pokerGameDelegate: PokerGame?
    private let deck: Deck = .init()
    
    func startGame() {
        let gameStyle = pokerGameDelegate?.gameStyle
        
        shuffleDeck()
        dealInitialCards()
    }
    
    // gameStyle에 따라 필요한 수의 카드만큼 분배
    private func dealInitialCards() {
        guard let pokerGame: PokerGame = pokerGameDelegate else { return }
        let initialCardsCount: Int = pokerGame.gameStyle.rawValue
        
        for player in pokerGame.players {
            dealCard(To: player, count: initialCardsCount)
        }
    }
    
    // 덱에서 카드 뽑아 건내주기
    private func dealCard(To player: Player, count: Int = 1) {
        guard deck.count() <= count else { endGame(); return }
        
        for _ in 0..<count {
            let card: Card? = deck.cards.popLast()
            if card != nil { player.getCard(card!) }
        }
    }
    
    private func shuffleDeck() {
        deck.shuffle()
    }
    
    private func endGame() {
        pokerGameDelegate?.endGame()
    }
}
