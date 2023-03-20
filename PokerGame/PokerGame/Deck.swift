//
//  Deck.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/15.
//

import Foundation

struct Deck {
    private var cards: [Card]
    
    init() {
        self.cards = []
    }
    
    func count() -> Int {
        cards.count
    }
    
    mutating func shuffle() {
        // 무작위 인덱스 생성 : 0...cards개수-1을 담은 배열, randomElement로 하나 빼고, remove를 통해 뺀 것 제거..
        // 제거한 인덱스로 cards에 접근, result: [Cards]에 추가
        // 인덱스를 추출하는 배열이 빌 때까지 이 작업을 반복한다
        // cards에 result를 할당한다
        // 끝
        // O(n)
        var arr = Array(0..<cards.count)
        var result: [Card] = .init()
        
        // 2 미만 수의 카드는 섞을 수 없으므로 리턴
        guard cards.count >= 1 else { return }
        
        while arr.count != 0 {
            let randomIndex = arr.randomElement()!
            let removeIdx = arr.firstIndex(of: randomIndex)!
            arr.remove(at: removeIdx)
            result.append(cards[randomIndex])
        }
        cards = result
    }
    
    mutating func removeOne() -> Card? {
        guard cards.count > 0 else { print("cards in deck is less then 1"); return nil }
        return cards.popLast()
    }
    
    // 모든 카드를 덱에 담는 함수. 순서가 정해져 있다.
    mutating func reset() {
        for shape in Shape.allCases {
            for rank in Rank.allCases {
                let card = Card(shape: shape, rank: rank)
                cards.append(card)
            }
        }
    }
}

// 테스트 코드
extension Deck {
    mutating func test() -> Bool {
        var results = [Bool]()
        results.append(test_reset())
        results.append(test_shuffle())
        results.append(test_removeOne())
        for result in results {
            print(result)
        }
        return test_reset() && test_shuffle() && test_removeOne()
    }
    
    mutating func test_reset() -> Bool {
        var cardDict: [Card:Int] = [:]
        
        self.reset()
        for card in cards {
            // deck을 reset하고 하나씩 딕셔너리에 넣는다. 이미 있으면(Dict[Card] != nil 이면) false
            // 모든 카드의 종류가 52개인지 확인한다. cardDict.count = 52 여야함..
            if cardDict[card] == nil {
                cardDict[card] = 1
            } else {
                // 같은 종류의 카드가 한 장 이상이 되어 테스트를 실패하는 경우
                return false
            }
        }
        return cardDict.count == 52
    }
    
    mutating func test_removeOne() -> Bool {
        let lastCard = cards.last
        let removedCard = self.removeOne()
        return lastCard == removedCard
    }
    
    mutating func test_shuffle() -> Bool {
        // 10번을 셔플작업을 반복한다.
        // 결과가 모두 다르다면, 정상적으로 동작한다고 판단한다.
        // 카드 수가 적으면 테스트 결과가 틀리기 쉽다.
        var shuffledCases: [[Card]] = [cards]
        
        for _ in 0..<10 {
            cards.shuffle()
            let newShuffledCase = cards
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
