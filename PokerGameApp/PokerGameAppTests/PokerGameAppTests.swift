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
    var sut2 : PhaseController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut1 = nil
        sut2 = nil
        try super.tearDownWithError()
    }
        
    
    func testSetPlayer메소드_5스터드모드_모든인원수에대하여_생성한PlayerList의내용_의도한타입과개수가들어가면_성공() {
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
    
    func testPhaseController에서동작하는_dealPhase메소드가_모든플레이어에게_의도한타입과개수의카드를분배하면_성공() {
        
        sut2 = PhaseController()
        
        for numberOfParticipant in 1...4 {
            let fiveStudResultPlayerList = sut2.dealPhase(mode: .fiveStud, numberOfParticipant: numberOfParticipant)
            
            for index in 0...numberOfParticipant {
                XCTAssertFalse(fiveStudResultPlayerList[index].isHavingProblemInHand5Stud())
                // 카드 5개가 들어갔는지 , 중복된 카드가 들어갔는지 체크해서 문제가 있으면 true 리턴 , false 일시 테스트 통과
            }
        }
        
        for numberOfParticipant in 1...4 {
            let fiveStudResultPlayerList = sut2.dealPhase(mode: .sevenStud, numberOfParticipant: numberOfParticipant)
            
            for index in 0...numberOfParticipant {
                XCTAssertFalse(fiveStudResultPlayerList[index].isHavingProblemInHand7Stud())
                // 카드 7개가 들어갔는지 , 중복된 카드가 들어갔는지 체크해서 문제가 있으면 true 리턴 , false 일시 테스트 통과
            }
        }
    }
}
