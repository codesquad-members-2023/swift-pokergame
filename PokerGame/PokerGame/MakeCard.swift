//
//  MakeCard.swift
//  PokerGame
//
//  Created by leehwajin on 2023/03/14.
//

import Foundation
import UIKit

class MakeCard{
    
    var shape : Shape
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
}


