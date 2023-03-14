//
//  MakeCard.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/14.
//

import Foundation
import UIKit

class MakeCard{
    //shape enum타입 한 이유 : 어짜피 모양은 4개중 하나니까
    var shape : Shape
    //number을 String으로 한 이유: AJQK로 변환을 해야하기 때문에 숫자로 받고 String으로 저장하는 형식으로 진행
    var number : String
    var imoticon : String
    var image : UIImage
    
    init(shape: Shape, number: Int) {
        
        self.shape = shape
        
        switch number{
        case 1:
            self.number = "A"
        case 11:
            self.number = "J"
        case 12:
            self.number = "Q"
        case 13:
            self.number = "K"
        default:
            self.number = String(number)
        }
        
        //shape에 따라 이모티콘과 이미지를 변경하기 위한 스위치문
        switch shape{
        case .clover :
            self.imoticon = "♣️"
            self.image = UIImage(named: "clover")!
        case .heart :
            self.imoticon = "❤️"
            self.image = UIImage(named: "heart")!
        case .spade :
            self.imoticon = "♠️"
            self.image = UIImage(named: "spade")!
        case .diamond :
            self.imoticon = "◆"
            self.image = UIImage(named: "diamond")!
        }
        
        
    }
    
    enum Shape{
        case heart
        case spade
        case clover
        case diamond
    }

    func printCard() {
        print(self.imoticon, self.number)
    }
}



