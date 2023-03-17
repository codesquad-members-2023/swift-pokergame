struct CardDeck {
    private var deck:[Card] = []
    
    init() {
        getAllCards()
    }
    
    func count() -> Int {
        return deck.count
    }
    
    mutating func shuffle() {
        for index in 0..<deck.count-1 {
            let switchIndex = Int.random(in: index..<deck.count)
            deck.swapAt(index, switchIndex)
        }
    }

    mutating func removeOne() throws -> Card {
        return deck.removeLast()
    }
    
    mutating func reset() {
        getAllCards()
    }

    mutating func getAllCards() {
        var cards:[Card] = []
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
        deck = cards
    }
}
