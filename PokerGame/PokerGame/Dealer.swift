//
//  Dealer.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/22.
//

import Foundation

class Dealer {
    private var pokerGameDelegate: PokerGame?
    private var deck: Deck = .init()
    
    func startGame() {
        let gameStyle = pokerGameDelegate?.gameStyle
        shuffleDeck()
        dealCards()
    }
    
    // 카드 나누어주기
    private func dealCards() {

    }
    
    private func shuffleDeck() {
        deck.shuffle()
    }
}
