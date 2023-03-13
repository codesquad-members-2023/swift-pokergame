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
        placeCards(number: 7, width: 55, spacing: 1, atPointX: 1, atPointY: 50)
        // 현재 장치 너비 구하기
        // let screenWidth = UIScreen.main.bounds.size.width
    }
}

extension ViewController {
    func placeCards(number: Int, width: CGFloat, spacing: CGFloat, atPointX startPointX: CGFloat, atPointY: CGFloat) {
        let cardHeight: CGFloat = width * 1.27
        var pointX = startPointX
        
        for _ in 0..<number {
            var imageView : UIImageView
            imageView  = UIImageView(frame:CGRectMake(pointX, atPointY, width, cardHeight));
            imageView.image = UIImage(named:"card-back.jpg")
            self.view.addSubview(imageView)
            pointX += width + spacing
        }
    }
}

