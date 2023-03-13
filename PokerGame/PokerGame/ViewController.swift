//
//  ViewController.swift
//  PokerGame
//
//  Created by 에디 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        placeCards(number: 4, spacing: 1, atPointX: 1, atPointY: 50)
        // 현재 장치 너비 구하기
        // let screenWidth = UIScreen.main.bounds.size.width
    }
}

extension ViewController {
    func placeCards(number: Int, spacing: CGFloat, atPointX startPointX: CGFloat, atPointY pointY: CGFloat) {
        // card만의 width를 모두 합한 값
        let widthWithoutSpacing = UIScreen.main.bounds.size.width - spacing * (CGFloat(number) + 1)
        let cardWidth: CGFloat = widthWithoutSpacing / CGFloat(number)
        let cardHeight: CGFloat = cardWidth * 1.27
        var pointX = startPointX
        
        for _ in 0..<number {
            var imageView : UIImageView
            imageView  = UIImageView(frame:CGRectMake(pointX, pointY, cardWidth, cardHeight));
            imageView.image = UIImage(named:"card-back.jpg")
            self.view.addSubview(imageView)
            pointX += cardWidth + spacing
        }
    }
}

