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
        self.setupViewControllerUIAttribute()
        self.renderSubViews()
    }
    
    private func setupViewControllerUIAttribute() {
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
    
    private func renderSubViews() {
        self.renderCardImageViews(startAt: CGPoint(x: 20, y: 60), offset: 5)
    }
    
    private func renderCardImageViews(startAt startCardOrigin: CGPoint, offset: CGFloat) {
        let cardBackImage = ImageAsset.load(from: .cardBack)
        let cardWidth = self.calculateCardImageViewWidth(startAt: startCardOrigin.x, offset: offset)
        var currentCardOrigin = startCardOrigin
        
        for _ in 0..<self.numberOfCards {
            self.renderCardImageView(with: cardBackImage, width: cardWidth, origin: currentCardOrigin)
            currentCardOrigin = CGPoint(
                x: currentCardOrigin.x + offset + cardWidth,
                y: currentCardOrigin.y
            )
        }
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
    
    private func calculateCardImageViewWidth(startAt startXCoordinate: CGFloat, offset: CGFloat) -> CGFloat {
        let entireSpacingForRow = self.calculateEntireSpacingForRow(startAt: startXCoordinate, offset: offset)
        let cardImageViewWidth = (self.view.bounds.width - entireSpacingForRow) / CGFloat(self.cardsPerRow)
        return cardImageViewWidth
    }
}
