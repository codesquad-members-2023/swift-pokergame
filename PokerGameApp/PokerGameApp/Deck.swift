
import Foundation


struct Deck {
    private var deck : [Card]
    
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
        if let drawedCard = self.deck.popLast() {
            return drawedCard
        }
        return nil
    }
    
    mutating func shuffle() {
        if self.deck.isEmpty == false {
            for i in stride(from: self.deck.count - 1, to: 0, by: -1) {
                let j = Int.random(in: 0...i)
                deck.swapAt(i, j)
            }
        }
    }
}

