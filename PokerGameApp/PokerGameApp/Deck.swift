
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
}
