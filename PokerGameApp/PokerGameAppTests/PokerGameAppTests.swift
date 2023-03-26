//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by ilim on 2023/03/24.
//

import XCTest
@testable import PokerGameApp

final class PokerGameAppTests: XCTestCase {
    private var sut: PokerGame!
    private var isValidNumberOfCards = true
    private var isValidNumberOfPlayers = true
    private var isThereNoDuplicatedCards = true
    private var isPokerGameEnded = false
    private var actualNumberOfCards = 0
    private let numberOfCards = 5
    private let numberOfPlayers = 4
    
    override func setUpWithError() throws {
        sut = PokerGame(numberOfPlayers: numberOfPlayers, numberOfCards: numberOfCards)
    }
    
    
}
