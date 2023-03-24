//
//  ViewController.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    let cardCount: Int = 7
    let spacing: CGFloat = 1
    let firstCard: Card = .init(shape: .Heart, rank: .queen)
    let secondCard: Card = .init(shape: .Space, rank: .seven)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        placeCards(count: cardCount, spacing: spacing, startAt: (0, 50))
        printCard(firstCard)
        printCard(secondCard)
        
        let deck = Deck()
        let testResult = DeckTester.testPokerDeck(deck)
        for result in testResult {
            print("test result : \(result)")
        }
    }
}

extension ViewController {
    func setBackground() {
        if let patternImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: patternImage)
        } else {
            print("UIImage named \"bg_pattern\" is not found.")
        }
    }
    
    func placeCards(count: Int, spacing: CGFloat, startAt point: (CGFloat, CGFloat)) {
        // card만의 width를 모두 합한 값
        var pointX: CGFloat = point.0
        let pointY: CGFloat = point.1
        let widthWithoutSpacing = UIScreen.main.bounds.size.width - spacing * (CGFloat(count) + 1)
        let cardWidth: CGFloat = widthWithoutSpacing / CGFloat(count)
        let cardHeight: CGFloat = cardWidth * 1.27
        
        var imageView: UIImageView
        for _ in 0..<count {
            imageView  = UIImageView(frame:CGRectMake(pointX, pointY, cardWidth, cardHeight))
            imageView.image = UIImage(named:"card-back.jpg")
            self.view.addSubview(imageView)
            pointX += cardWidth + spacing
        }
    }
    
    func printCard(_ card: Card) {
        print(card.description)
    }
}
