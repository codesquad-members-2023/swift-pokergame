
import Foundation


struct Deck {
   var deck : [Card] = []
    
    func count() -> Int {
        return self.deck.count
    }
    
    mutating func reset() {
        for shape in Card.Shape.allCases{
            for rank in Card.Rank.allCases{
                self.deck.append(Card(shape: shape, rank: rank))
            }
        }
    }
    mutating func removeOne() -> Card? {
        guard self.deck.isEmpty == false else {
            return nil
        }
        return self.deck.popLast()
    }
    
    mutating func shuffle() {
        guard self.deck.isEmpty == false else {
            return
        }
        
        for i in stride(from: self.deck.count - 1, to: 0, by: -1) {
            let j = Int.random(in: 0...i)
            deck.swapAt(i, j)
        }
    }
}

extension Deck: CustomStringConvertible {
    var description : String {
        var result = ""
        for card in self.deck {
            result += card.description
            result += " "
        }
        return result
    }
}
