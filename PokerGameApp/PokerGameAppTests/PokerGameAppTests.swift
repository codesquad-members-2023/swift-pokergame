//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by SONG on 2023/03/22.
//

import XCTest

@testable import PokerGameApp
final class PokerGameAppTests: XCTestCase {
    var sut1 : GameSetting!
    var sut2 : GameController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut1 = nil
        sut2 = nil
        try super.tearDownWithError()
    }
        
    
    func testSetPlayer() {
        // given
        let numberOfdealer = 1
        
        for numberOfParticipant in 1...4 {
            // when
            sut1 = GameSetting(.fiveStud, numberOfParticipant)
            
            sut1.setPlayer()
            
            let participantCount = sut1.playerList.filter { $0 is Participant }.count // 타입 체크
            let dealerCount = sut1.playerList.filter { $0 is Dealer }.count
            
            // then
            XCTAssertEqual(participantCount + dealerCount, numberOfParticipant + numberOfdealer ) // 개수 체크
        }
    }
    
    func testGameController() {
        
        sut2 = GameController()
        
        for numberOfParticipant in 1...4 {
            let fiveStudResultPlayerList = sut2.run(mode: .fiveStud, numberOfParticipant: numberOfParticipant)
            
            for index in 0...numberOfParticipant {
                XCTAssertFalse(fiveStudResultPlayerList[index].isHavingProblemInHand5Stud())
                // 카드 5개가 들어갔는지 , 중복된 카드가 들어갔는지 체크해서 문제가 있으면 true 리턴 , false 일시 테스트 통과
            }
        }
        
        for numberOfParticipant in 1...4 {
            let fiveStudResultPlayerList = sut2.run(mode: .sevenStud, numberOfParticipant: numberOfParticipant)
            
            for index in 0...numberOfParticipant {
                XCTAssertFalse(fiveStudResultPlayerList[index].isHavingProblemInHand7Stud())
                // 카드 7개가 들어갔는지 , 중복된 카드가 들어갔는지 체크해서 문제가 있으면 true 리턴 , false 일시 테스트 통과
            }
        }
    }
}
