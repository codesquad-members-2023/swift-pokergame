//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/22.
//

import Foundation

class PokerGame {
    private var dealer: Participant
    private var participants = [Participant]()
    private var deck = CardDeck()
    private var numberOfCard = 0
    private var selectedNames = Set<String>()
    private let playerNames = ["JK", "Honux", "Crong", "Chloe", "Demia", "Aiden", "Harim", "Wolve", "Effie", "Wood", "Eddie", "Haena", "Sol", "Noah"]

    init(numberOfPlayers: Int, numberOfCards: Int) {
        deck.reset()
        deck.shuffle()
        dealer = Participant(name: "Dealer")
        participants.append(dealer)
        selectedNames = setPlayerName(randomNumber: numberOfPlayers)
        numberOfCard = numberOfCards
    }
    
    func setParticipants() {
        if participants.count == 1 {
            for name in selectedNames {
                participants.append(Participant(name: name))
            }
        } else {
            participants.forEach() { $0.initDeck() }
        }
    }
    
    func dealCards() {
        for _ in 0 ..< numberOfCard {
            participants.forEach() { $0.setDeck(card: dealer.popCard(deck: deck)) }
        }
    }
    
    func startGame() {
        setParticipants()
        dealCards()
    }
    
    func checkEndGame() -> Bool {
        deck.count() < numberOfCard * participants.count ? true : false
    }
    
    func setPlayerName(randomNumber: Int) -> Set<String> {
        var names = Set<String>()
        
        while true {
            names.insert(playerNames.randomElement() ?? "")
            if names.count == randomNumber { break }
        }
        
        return names
    }
}
