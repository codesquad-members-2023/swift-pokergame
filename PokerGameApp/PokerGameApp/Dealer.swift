//
//  Dealer.swift
//  PokerGameApp
//
//  Created by SONG on 2023/03/20.
//

import Foundation

class Dealer : Player {
    private var gameDeck : Deck
    private var gameMode : GameSetting.Mode
    
    
    init(_ gameDeck : Deck,_ gameMode : GameSetting.Mode) {
        self.gameDeck = gameDeck
        self.gameMode = gameMode
        super.init()
        self.name = "Dealer"
    }
    
    func shuffle() {
        self.gameDeck.shuffle()
    }
    
    func isDealingPossible() -> Bool {
        let numberOfCardInDeck = self.gameDeck.count()
        let cardForEachHandByMode = self.gameMode.numberOfCard()
        let numberOfPlayer = self.playerList.count
        
    }
    
    private func draw() -> [Card] {
        let numberOfDrawedCard = deciseNumberOfCardByMode()
        var drawedCard : [Card] = []
        
        for _ in 0..<numberOfDrawedCard {
            guard let item = self.gameDeck.removeOne() else{
                return []
            }
            drawedCard.append(item)
        }
        return drawedCard
    }
    
    private func give(_ cards: [Card],to gamer : Player ) {
        gamer.addCardsToHand(cards)
    }
    
    private func deal() {
        guard isDealingPossible() else {
            return
        }
        
        for player in playerList {
            let cards = draw()
            give(cards, to: player)
        }
    }
    
    func dealHowManyCardByMode() -> Int{
        return self.gameMode.numberOfCard()
    }
    
}
