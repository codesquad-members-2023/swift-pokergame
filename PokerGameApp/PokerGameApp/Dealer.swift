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
    }
    
    func shuffle() {
        self.gameDeck.shuffle()
    }
    
    func draw() -> [Card]? {
        let numberOfDrawedCard = dealHowManyCardByMode()
        var drawedCard : [Card] = []
        
        for _ in 0...numberOfDrawedCard-1 {
            guard let item = self.gameDeck.removeOne() else{
                return nil
            }
            drawedCard.append(item)
        }
        return drawedCard
    }
    
    func give(_ cards: [Card],to gamer : Player ) {
        gamer.addCardsToHand(cards)
    }
    
    func deal() {
        
    }
    
    func dealHowManyCardByMode() -> Int{
        return self.gameMode.numberOfCard()
    }
}
