//
//  ViewController.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printCardImage()
    }
    
    func printCardImage() {
        guard let backgroundImage = UIImage(named: "bg_pattern")else {
            print("배경이미지 오류.")
            return
        }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        
        var haveCard = Array(repeating: MakeCard(shape: .clover, number: 1), count: 7)
        haveCard[3] = MakeCard(shape: .heart, number: 4)

        //프린트하는코드
        var cardLocateX: CGFloat = 2.5
        let cardLocateY: CGFloat = 60
        let ratio = 1.27
        let numberCards: CGFloat = 7
        let spacingCard: CGFloat = 5
        let cardWidth = (self.view.frame.width / numberCards)-spacingCard
        let cardHeight = cardWidth * ratio
        for index in 0..<haveCard.count {
            let cardImageView = UIImageView(image: haveCard[index].image)
            cardImageView.frame = CGRect(x: cardLocateX, y: cardLocateY, width: cardWidth, height: cardHeight)
            self.view.addSubview(cardImageView)
            cardLocateX += (cardWidth+spacingCard)
        }
    }
}



