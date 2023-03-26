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
    
    func testPokerGame_WhenNumberOfCardAndPlayersProvided_ShouldReturnTrue() {
        sut.setGame()
        let players = sut.getPlayersAndDealer().player
        let dealer = sut.getPlayersAndDealer().dealer
        var totalNumberOfCard = 0
        
        isValidNumberOfPlayers = numberOfPlayers != players.count ? false : true
        isValidNumberOfCards = checkNumberOfCards(numberOfCards: numberOfCards, players: players, dealer: dealer)
        totalNumberOfCard = checkDuplicatedCard(players: players, dealer: dealer)
        endGame()
        
        XCTAssertTrue(isValidNumberOfPlayers, "플레이어 인원 수 불일치 : 예상 인원 수 = \(numberOfPlayers), 실제 인원 수 = \(players.count)")
        XCTAssertTrue(isValidNumberOfCards, "카드 수 불일치 : 예상 카드 수 = \(numberOfCards), 실제 플레이어 카드 수 = \(actualNumberOfCards == 0 ? sut.numberOfPlayerCard() : actualNumberOfCards ), 실제 딜러 카드 수 = \(dealer.numberOfCards())")
        XCTAssertTrue(isThereNoDuplicatedCards, "중복되는 카드 존재 : 예상 카드 수 = \(numberOfCards * (numberOfPlayers + 1)), 실제 카드 수 = \(totalNumberOfCard)")
        XCTAssertTrue(isPokerGameEnded, "게임이 종료 되지 않음 : 최소 필요 카드 수 = \(numberOfCards * (numberOfPlayers + 1)), 현재 잔여 카드 수 = \(sut.checkRemainNumberOfCard())")
    }
    
    func checkNumberOfCards(numberOfCards: Int, players: [Player], dealer: Dealer) -> Bool {
        for player in players {
            if numberOfCards != player.numberOfCards() {
                isValidNumberOfCards = false
                actualNumberOfCards = player.numberOfCards()
                return isValidNumberOfCards
            }
        }
        
        if dealer.numberOfCards() != numberOfCards {
            isValidNumberOfCards = false
            return isValidNumberOfCards
        }
        
        return isValidNumberOfCards
    }
    
}
