//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/22.
//

import Foundation

class PokerGame {
    private var dealer = Dealer()
    private var players = [Player]()
    private var deck = CardDeck()
    private var numberOfCard = 0
    private var selectedNames = Set<String>()
    private var playerCount = Int.random(in: 1...4)
    private var numberOfStud = [5, 7].randomElement()
    let playerNames = ["JK", "Honux", "Crong", "Chloe", "Demia", "Aiden", "Harim", "Wolve", "Effie", "Wood", "Eddie", "Haena", "Sol", "Noah"]

    init(numberOfPlayers: Int, numberOfCards: Int) {
        deck.reset()
        deck.shuffle()
        selectedNames = setPlayerName(randomNumber: numberOfPlayers)
        numberOfCard = numberOfCards
    }
    
    deinit {
        print("> 카드가 부족합니다.\n게임이 종료됩니다.")
    }
    
    func setGame() {
        if players.isEmpty {
            for name in selectedNames {
                let player = Player(name: name, cardDeck: makeDeck())
                players.append(player)
            }
            dealer.selfDistribution(deck: self.deck, numberOfCard: numberOfCard)
        } else {
            for player in players {
                player.resetCards(cards: makeDeck())
            }
            dealer.resetCards(cards: makeDeck())
        }
    }
    
    func makeDeck() -> [Card?] {
        let deck = dealer.cardDistribution(deck: self.deck, numberOfCard: numberOfCard)
        return deck
    }
    
    func cardCheck() -> Bool {
        deck.count() < numberOfCard * (playerCount + 1) ? true : false
    }
    
    
}
