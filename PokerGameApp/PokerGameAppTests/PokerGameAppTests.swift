//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by ilim on 2023/03/24.
//

import XCTest
@testable import PokerGameApp

final class PokerGameAppTests: XCTestCase {
    private var game: PokerGame!
    private var players: [Participant]!
    private var playersName: Set<String>!
    private var dealer: Participant!
    private var deck: CardDeck!
    private var numberOfCards = Stud.fiveStud.setNumberOfCards()
    private var numberOfPlayers = NumberOfPlayers.four.setNumberOfPlayers()
    
    override func setUpWithError() throws {
        game = PokerGame(numberOfPlayers: self.numberOfPlayers, numberOfCards: self.numberOfCards)
        playersName = game.setPlayerName(randomNumber: numberOfPlayers)
        players = setParticipants(names: playersName)
        dealer = Participant(name: "Dealer")
        players.append(dealer)
        deck = CardDeck()
        dealCards()
    }
    
    override func tearDownWithError() throws {
        game = nil
        players = nil
        dealer = nil
        deck = nil
    }
    
    func testPokerGame_WhenNumberOfCardAndPlayersProvided_ShouldReturnTrue() { // 이름 바꾸는거 고려해보기
        XCTAssertEqual(players.count, numberOfPlayers + 1)
        XCTAssertEqual(checkNumberofCards(numberOfCards: numberOfCards), true)
        XCTAssertEqual(isThereDealer(), true)
        XCTAssertEqual(isThereDuplicatedCardInDeck(), true)
        XCTAssertEqual(isGameEnded(), true)
    }
    
    func dealCards() {
        for _ in 0 ..< numberOfCards {
            players.forEach() { $0.setDeck(card: dealer.popCard(deck: deck)) }
        }
    }
    
    func setParticipants(names: Set<String>) -> [Participant] {
        var players = [Participant]()
        
        for name in names {
            players.append(Participant(name: name))
        }
        
        return players
    }
    
    func checkNumberofCards(numberOfCards: Int) -> Bool {
        var isNumberOfCardCorrect = true
        
        for player in players {
            if player.numberOfCards() != numberOfCards {
                isNumberOfCardCorrect = false
                break
            }
        }
        
        return isNumberOfCardCorrect
    }
    
    func isThereDealer() -> Bool {
        if dealer != nil { return true }
        else { return false }
    }
    
    func isThereDuplicatedCardInDeck() -> Bool {
        var deck = [Card?]()
        
        for _ in 0 ..< self.deck.count() {
            deck.append(self.deck.removeOne())
        }
        
        let setOfDeck = Set(deck)
        
        if setOfDeck.count == deck.count { return true }
        else { return false }
    }
    
    func isGameEnded() -> Bool {
        while true {
            game.startGame()
            
            if game.checkEndGame() {
                break
            }
        }
        
        return true
    }
}
