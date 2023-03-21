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
        var cardDeck = CardDeck()
        gameStart(cardDeck: cardDeck)
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
        for i in deck.ReturnStackCards(){
            print(i.description,terminator: " ")
        }
        
        print("\n------셔플셔플------\n")
        
        //카드 셔플
        deck.shuffle()
        for i in deck.ReturnStackCards(){
            print(i.description,terminator: " ")
        }
        
        print("\n------셔플셔플------\n")
        
        //셔플이 랜덤하게 되는지 한번 더 확인
        deck.shuffle()
        for i in deck.ReturnStackCards(){
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
    
    func gameStart(cardDeck:CardDeck){
            var tempCardDeck = cardDeck
            var gameCount = 1
            var nameCollecton = ["haena", "JK", "crong", "honux", "chloe"]
            nameCollecton.shuffle()
            let numberUsers = 2
            let numberStuds = 7
            
            print("\(numberStuds)카드 기준, 참가자 \(numberUsers)명일때")
            
            while true {
                tempCardDeck.shuffle()
                let dealer = Dealer(name: "dealer")
                var userCollection: [Participant] = [dealer]

                for i in 0..<numberUsers{
                    userCollection.append(Participant(name: nameCollecton[i]))
                }

                for i in userCollection{
                    for _ in 0..<numberStuds{
                        let newCard = dealer.removeOne(cardDeck: tempCardDeck)
                        i.haveCard.append(newCard)
                    }
                }

                print("--------\(gameCount)번째 게임 시작 --------")

                for i in 0..<userCollection.count{
                    print("\(userCollection[i].name!)의 카드 \(userCollection[i].haveCard)")
                }
                gameCount += 1
            }
        }
}



