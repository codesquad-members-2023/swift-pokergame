//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Effie on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
  
  private lazy var safeAreaSideMargin: CGFloat = 16
  
  private let cardAspectRatio = CGFloat(1.27)
  
  private let cardImage = UIImage(named: "card-back")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    addCards(ofRatio: cardAspectRatio, numberOfCard: 7, withInset: 1.0)
    
//    testCards()
    testGame()
  }
  
  private func configure() {
    guard let pattermImage = UIImage(named: "bg_pattern") else { return }
    view.backgroundColor = .init(patternImage: pattermImage)
  }
  
  private func addCards(ofRatio cardAspectRatio: CGFloat, numberOfCard: Int, withInset insetWidth: CGFloat) {
    let bothSideMargins = safeAreaSideMargin * 2
    let allSpacing = insetWidth * CGFloat(numberOfCard - 1)
    let cardWidth = (view.frame.width - bothSideMargins - allSpacing) / CGFloat(numberOfCard)
    let cardHeight = cardWidth * cardAspectRatio
    
    var previousCard: UIImageView? = nil
    
    for _ in 0..<numberOfCard {
      let currentCard = UIImageView(image: cardImage)
      view.addSubview(currentCard)
      
      currentCard.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        currentCard.widthAnchor.constraint(equalToConstant: cardWidth),
        currentCard.heightAnchor.constraint(equalToConstant: cardHeight),
        currentCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
      ])
      
      if let previous = previousCard {
        currentCard.leadingAnchor.constraint(equalTo: previous.trailingAnchor, constant: insetWidth).isActive = true
      } else {
        currentCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: safeAreaSideMargin).isActive = true
      }
      
      previousCard = currentCard
    }
  }
  
  private func testCards() {
    let outputManager = OutputManager()
    
    let heartQueen = Card(shape: .heart, number: .queen)
    outputManager.printInfo(ofCard: heartQueen)
    
    let spadeKing = Card(shape: .spade, number: .king)
    outputManager.printInfo(ofCard: spadeKing)
    
    let cloveAce = Card(shape: .clove, number: .ace)
    outputManager.printInfo(ofCard: cloveAce)
    
    let diamondJack = Card(shape: .diamond, number: .jack)
    outputManager.printInfo(ofCard: diamondJack)
    
    let diamondEight = Card(shape: .diamond, number: .eight)
    outputManager.printInfo(ofCard: diamondEight)
  }
  
  private func testGame() {
    var game = PokerGame()
    
    let scenario = [
      "카드 초기화",
      "카드 섞기",
      "카드 하나 뽑기",
      "카드 하나 뽑기",
    ]
    game.test(scenario: scenario)
  }
}
