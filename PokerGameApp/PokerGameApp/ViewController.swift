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
        makeSevenCard()
    }
    
    func makeBackgroundView() {
        guard let backgroundImage = UIImage(named: "background") else { return }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
    }
    
    private func makeCardView(xCoordinate: Double, yCoordinate: Int, cardWidth: Int, cardHeight: Double) -> UIImageView {
        let cardView = UIImageView(frame: CGRect(x: xCoordinate, y: Double(yCoordinate), width: Double(cardWidth), height: cardHeight))
        cardView.image = cardBackImage
        return cardView
    }
    
    func makeSevenCard() {
        let interval = 5
        let numberOfCards = 7
        let spaceFromBorder = 6.5
        let cardWidth = 50
        let cardHeight = Double(cardWidth) * 1.27
        let yCoordinate = 55
        for i in 0 ..< numberOfCards {
            let cardImage = makeCardView(xCoordinate: spaceFromBorder + Double((interval + cardWidth) * i), yCoordinate: yCoordinate, cardWidth: cardWidth, cardHeight: cardHeight)
            self.view.addSubview(cardImage)
        }
    }
}

