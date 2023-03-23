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
        
    
    func testSetPlayer() {
        // given
        let numberOfdealer = 1
        
        for numberOfParticipant in 1...4 {
            // when
            sut = GameSetting(.fiveStud, numberOfParticipant)
            
            sut.setPlayer()
            
            let participantCount = sut.playerList.filter { $0 is Participant }.count // 타입 체크
            let dealerCount = sut.playerList.filter { $0 is Dealer }.count
            
            // then
            XCTAssertEqual(participantCount + dealerCount, numberOfParticipant + numberOfdealer ) // 개수 체크
        }
    }

}
