//
//  PokerGameTests.swift
//  PokerGameTests
//
//  Created by leehwajin on 2023/03/20.
//

import XCTest

final class PokerGameTests: XCTestCase {
    
    var testCardDeck: CardDeck!
    var lastCard: Card!
    var numberOriginCards: Int!
    var shuffleResultCollection : [[Card]]!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        testCardDeck = CardDeck()
        lastCard = testCardDeck.ReturnStackCards().last
        numberOriginCards = 52
        shuffleResultCollection = []
    }
    
    
    func testRemoveOne_WhenYouRunRemoveOne_DeleteBackStackCards(){
        var cnt = 1
        
        for _ in 0..<numberOriginCards{
            lastCard = testCardDeck.ReturnStackCards().last
            let removeCard = testCardDeck.removeOne()
            XCTAssertEqual(numberOriginCards, testCardDeck.count() + cnt)//하나가 사라졌는지
            XCTAssertEqual(lastCard, removeCard)//마지막 카드가 지워진 카드와 같은지 확인
            cnt += 1
        }
    }
    
    func testShuffle_WhenCardDeckStackCardsShuffle_ShouldReturnFalse(){
        for _ in 0..<999{
            testCardDeck.shuffle()
            XCTAssertFalse(shuffleResultCollection.contains(testCardDeck.ReturnStackCards()))
            shuffleResultCollection.append(testCardDeck.ReturnStackCards())
        }
    }
    
    func testReset_WhenYouRunReset_SameAsBeginningStackCards(){
        testCardDeck.reset()
        XCTAssertEqual(testCardDeck.ReturnStackCards(), CardDeck().ReturnStackCards())
    }
    
    override func tearDownWithError() throws {
        testCardDeck = nil
        lastCard = nil
        numberOriginCards = nil
        shuffleResultCollection = nil
        try super.tearDownWithError()
    }
}
