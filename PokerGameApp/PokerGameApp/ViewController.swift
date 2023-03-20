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
        var deck = CardDeck()
        deck.reset()
        deck.removeOne()
        deck.shuffle()
        deck.reset()
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
}

