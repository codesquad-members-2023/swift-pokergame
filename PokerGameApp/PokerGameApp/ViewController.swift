//
//  ViewController.swift
//  PokerGameApp
//
//  Created by ilim on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {

    private let cardBackImage = UIImage(named: "card_back")

    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackgroundView()
        setCard()
        testScenario()
    }
    
    func makeBackgroundView() {
        guard let backgroundImage = UIImage(named: "background") else { return }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
    }
    
    private func makeCardView(xCoordinate: CGFloat, yCoordinate: CGFloat, cardWidth: CGFloat, cardHeight: CGFloat) -> UIImageView {
        let cardView = UIImageView(frame: CGRect(x: xCoordinate, y: yCoordinate, width: cardWidth, height: cardHeight))
        cardView.image = cardBackImage
        return cardView
    }
    
    func setCard() {
        let screenWidth = UIScreen.main.bounds.size.width
        let numberOfCards = 7
        let interval = (screenWidth * 0.1)/CGFloat(numberOfCards + 1)
        let cardWidth = (screenWidth * 0.9)/CGFloat(numberOfCards)
        let cardHeight = cardWidth * 1.27
        let yCoordinate: CGFloat = 55
        for i in 0 ..< numberOfCards {
            let cardImage = makeCardView(xCoordinate: interval + (interval + cardWidth) * CGFloat(i), yCoordinate: yCoordinate, cardWidth: cardWidth, cardHeight: cardHeight)
            self.view.addSubview(cardImage)
        }
    }
    
    func testScenario() {
        var deck = CardDeck()
        print("> 카드 초기화 \n카드 전체를 초기화 했습니다.\n")
        deck.reset()
        print("> 카드 섞기. 전체 52장의 카드를 섞었습니다.\n")
        deck.shuffle()
        print("> 카드 하나 뽑기\n= \(deck.removeOne())")
        print("\(deck.count())장의 카드가 남았습니다.\n")
        print("> 카드 하나 뽑기\n= \(deck.removeOne())")
        print("\(deck.count())장의 카드가 남았습니다.\n")
        print("> 카드 초기화 \n카드 전체를 초기화 했습니다.")
        deck.reset()
        print("\(deck.count())장의 카드가 남았습니다.")
    }
}


