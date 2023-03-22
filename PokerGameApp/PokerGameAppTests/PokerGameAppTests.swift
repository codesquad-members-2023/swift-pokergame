//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by SONG on 2023/03/22.
//

import XCTest

@testable import PokerGameApp
final class PokerGameAppTests: XCTestCase {
    var sut : GameSetting!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
        
    func testExample() throws {
            
    }
    
    func testPerformanceExample() throws {
        measure {
        }
    }
    
    func testSetPlayer() {
        let numberOfPlayer : Int = 1
        var count = 0
        var isParticipant : Bool
        var isDealer : Bool
        sut = GameSetting(.fiveStud, numberOfPlayer)
        
        
        sut.setPlayer()
        
        for player in sut.playerList {
            isParticipant = type(of: player) == (Participant.self)
            isDealer = type(of: player) == (Dealer.self)
            
            XCTAssertTrue(isParticipant || isDealer)
            count += 1
        }
        
        XCTAssertEqual(sut.playerList.count, count , "다시해라.")
    }
}
