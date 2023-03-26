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

}
