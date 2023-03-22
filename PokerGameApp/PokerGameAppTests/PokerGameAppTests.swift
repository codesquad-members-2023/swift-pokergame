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
        let numberOfdealer = 1
        for numberOfPlayer in 1...4{
            sut = GameSetting(.fiveStud, numberOfPlayer)
            
            sut.setPlayer()
            
            let participantCount = sut.playerList.filter { $0 is Participant }.count
            let dealerCount = sut.playerList.filter { $0 is Dealer }.count
            
            XCTAssertEqual(participantCount + dealerCount, numberOfPlayer + numberOfdealer )
        }
    }

}
