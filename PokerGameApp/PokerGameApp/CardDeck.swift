//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Effie on 2023/03/20.
//

import Foundation

struct CardDeck {
  private var cards: [Card]
  
  var count: Int {
    cards.count
  }
  
  init() {
    self.cards = Self.createNewDeck()
  }
  
  private static func createNewDeck() -> [Card] {
    var newCards = [Card]()
    for number in Card.Number.allCases {
      for shape in Card.Shape.allCases {
        let newCard = Card(shape: shape, number: number)
        newCards.append(newCard)
      }
    }
    return newCards
  }
  
  mutating func shuffle() {
    cards.myShuffle()
  }
  
  mutating func removeOne() throws -> Card {
    guard cards.isEmpty == false else { throw PokerError.EmptyDeck }
    return cards.removeLast()
  }
  
  mutating func reset() {
    cards = Self.createNewDeck()
  }
}
