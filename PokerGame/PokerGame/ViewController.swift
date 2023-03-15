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
        
        let card = Card(shape: .heart, number: .two)
        print(card.description)
        
        testCode()
    }
    
    func printCardImage() {
        if let backgroundImage = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
    
        var cardLocateX: CGFloat = 2.5
        let cardLocateY: CGFloat = 60
        let ratio = 1.27
        let numberCards: CGFloat = 7
        let spacingCard: CGFloat = 5
        let cardWidth = (self.view.frame.width / numberCards)-spacingCard
        let cardHeight = cardWidth * ratio
        for _ in 0..<7 {
            if let cardBackImage = UIImage(named: "card-back") {
                let cardImageView = UIImageView(image: cardBackImage)
                cardImageView.frame = CGRect(x: cardLocateX, y: cardLocateY, width: cardWidth, height: cardHeight)
                self.view.addSubview(cardImageView)
                cardLocateX += (cardWidth+spacingCard)
            }
        }
    }
    
    
    func testCode(){
        //카드초기화
        var deck = CardDeck()
        for i in deck.ReturnCardArray(){
            print(i.description,terminator: " ")
        }
        
        print("\n------셔플셔플------\n")
        
        //카드 셔플
        deck.shuffle()
        for i in deck.ReturnCardArray(){
            print(i.description,terminator: " ")
        }
        
        print("\n------셔플셔플------\n")
        
        //셔플이 랜덤하게 되는지 한번 더 확인
        deck.shuffle()
        for i in deck.ReturnCardArray(){
            print(i.description,terminator: " ")
        }
        
        //카드 하나 뽑기
        print("\n")
        print("카드 갯수: \(deck.count())")
        var cardPicked = deck.removeOne()
        print("뽑은카드 : \(cardPicked.description)")
        print("남은 카드 갯수 : \(deck.count())")
        
        //카드 하나 뽑기
        cardPicked = deck.removeOne()
        print("뽑은카드 : \(cardPicked.description)")
        print("남은 카드 갯수 : \(deck.count())")
    }
}



