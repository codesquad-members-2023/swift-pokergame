//
//  PokerGame_EddieTests.swift
//  PokerGame_EddieTests
//
//  Created by 에디 on 2023/03/23.
//

import XCTest

final class PokerGame_EddieTests: XCTestCase {
    private var sut: PokerGame = .init()
    
    override func setUpWithError() throws { }
    
    override func tearDownWithError() throws {}
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        XCTAssert(true)
    }
    
    func testPokerGame_WhenUsingStartingGameWithFourPlayers_ShouldGivePlayers_Adequate_Number_Of_Cards() throws {
        sut.startGame(with: 4)
        testPlayersCardsCountIs(5)
        
        sut.endGame()
        sut.gameStyle = .SevenCardStud
        sut.startGame()
        testPlayersCardsCountIs(7)
        
        return XCTAssert(true)
        
        func testPlayersCardsCountIs(_ count: Int) {
            for player in sut.players {
                let numberOfCards = player.cards.count
                guard numberOfCards == count else { return XCTAssert(false, "Player got \(numberOfCards) cards. It must be \(count)")}
            }
        }
    }
}
