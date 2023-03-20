//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Effie on 2023/03/20.
//

import Foundation

struct PokerGame {
  
  var cardDeck: CardDeck
  
  init() {
    self.cardDeck = CardDeck()
  }
  
  mutating func test(scenario: [String]) {
    for command in scenario {
      print(">", terminator: " ")
      print(command)
      parseAndProcess(command: command)
    }
  }
  
  mutating func parseAndProcess(command: String) {
    switch command {
    case "카드 초기화":
      cardDeck.reset()
      print("카드 전체를 초기화했습니다.")
      print("총 \(cardDeck.count)장의 카드가 있습니다.\n")
    case "카드 섞기":
      cardDeck.shuffle()
      print("전체 \(cardDeck.count)장의 카드를 섞었습니다.\n")
    case "카드 하나 뽑기":
      guard let selected = cardDeck.removeOne() else { break }
      OutputManager().printInfo(ofCard: selected)
      print("총 \(cardDeck.count)장의 카드가 남아있습니다.\n")
    default:
      return
    }
  }
}
