//
//  DeckTester.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/21.
//

import Foundation

class DeckTester {
    static func testPokerDeck(_ deck: CardDeck) -> [Bool] {
        var results = [Bool]()
        
        results.append(test_reset(deck, cardKind: .Poker))
        results.append(test_shuffle(deck))
        results.append(test_removeOne(deck))
        return results
    }
    
    static func test_reset(_ deck: CardDeck, cardKind: CardKind) -> Bool {
        var cardCheckingDict: [Card:Int] = [:]
        
        for card in deck.cards {
            // deck을 reset하고 하나씩 딕셔너리에 넣는다. 이미 있으면(Dict[Card] != nil 이면) false
            // 모든 카드의 종류가 n개인지 확인한다. poker의 경우 cardDict.count = 52 여야함
            if cardCheckingDict[card] == nil {
                cardCheckingDict[card] = 1
            } else {
                // 같은 종류의 카드가 한 장 이상이 되어 테스트를 실패하는 경우
                return false
            }
        }
        return cardCheckingDict.count == cardKind.rawValue
    }
    
    static func test_removeOne(_ deck: CardDeck) -> Bool {
        var deck = deck
        let lastCard = deck.cards.last
        let removedCard = deck.removeOne()
        return lastCard == removedCard
    }
    
    static func test_shuffle(_ deck: CardDeck) -> Bool {
        // 10번의 셔플작업을 반복한다.
        // 결과가 모두 다르다면, 정상적으로 동작한다고 판단한다.
        // 카드 수가 적으면 테스트 결과가 틀리기 쉽다.
        var deck = deck
        var shuffledCases: [[Card]] = [deck.cards]
        
        for _ in 0..<10 {
            deck.shuffle()
            let newShuffledCase = deck.cards
            shuffledCases.append(newShuffledCase)
        }
        
        for i in 0..<shuffledCases.count - 1 {
            for j in i+1..<shuffledCases.count {
                if shuffledCases[i] == shuffledCases[j] { return false }
            }
        }
        return true
    }
}

protocol CardDeck {
    var cards: [Card] { get set }
    
    func count() -> Int
    mutating func reset()
    mutating func removeOne() -> Card?
    mutating func shuffle()
}

// 테스터의 확장성을 위해 작성
// 현재 reset의 기능상 카드 종류(ex. 화투)마다 비교할 카드 총 개수가 다르다
enum CardKind: Int {
    case Poker = 52
}
