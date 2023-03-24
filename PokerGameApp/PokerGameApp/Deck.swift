
import Foundation


struct Deck {
   private var deck : [Card] = []
    
    init() {
        for shape in Card.Shape.allCases{
            for rank in Card.Rank.allCases{
                self.deck.append(Card(shape: shape, rank: rank))
            }
        }
    }
    
    func count() -> Int {
        return self.deck.count
    }
    
    mutating func reset() {
        var index = 0
        for shape in Card.Shape.allCases{
            for rank in Card.Rank.allCases{
                self.deck[index] = Card(shape: shape, rank: rank)
                index += 1
            }
        }
    }
    mutating func removeOne() -> Card? {
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
