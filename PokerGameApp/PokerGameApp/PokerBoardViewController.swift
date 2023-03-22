//
//  PokerBoardViewController.swift
//  PokerGameApp
//
//  Created by Noah on 2023/03/16.
//

import UIKit

final class PokerBoardViewController: UIViewController {
    
    private let cardsPerRow: Int
    private let numberOfCards: Int
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    init(cardsPerRow: Int, numberOfCards: Int) {
        self.cardsPerRow = cardsPerRow
        self.numberOfCards = numberOfCards
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        self.cardsPerRow = 0
        self.numberOfCards = 0
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBackgroundColor()
    }
    
    private func setupBackgroundColor() {
        guard let pokerBoardBackground = ImageAsset.load(from: .pokerBoard)
        else {
            self.view.backgroundColor = UIColor.black
            return
        }
        self.view.backgroundColor = UIColor(patternImage: pokerBoardBackground)
    }
    private func renderCardImageView(with cardImage: UIImage?, width: CGFloat, origin: CGPoint) {
        let cardImageView = CardImageView(
            image: cardImage,
            width: width,
            origin: origin
        )
        self.view.addSubview(cardImageView)
    }
    
    private func calculateEntireSpacingForRow(
        startAt startIntervalForFirstCardInRow: CGFloat,
        offset: CGFloat
    ) -> CGFloat {
        let entireOffset = offset * CGFloat(self.cardsPerRow - 1)
        let endIntervalForLastCardInRow = startIntervalForFirstCardInRow
        let entireSpacing = startIntervalForFirstCardInRow + endIntervalForLastCardInRow + entireOffset
        return entireSpacing
    }
}
