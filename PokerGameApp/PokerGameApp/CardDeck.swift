// 덱은 미션을 끝까지 봤을 때 하나만 구현해도 된다고 생각하였고
// 상속이나 재사용성을 활용할 경우가 없다 생각하여 구조체로 선언
struct CardDeck {
    private var deck:[Card] = []
    
    // 초기화와 동시에 54장의 카드를 가지도록 의도하여 reset 메소드를 호출 함
    init() {
        reset()
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
        deck = []
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                deck.append(Card(suit: suit, rank: rank))
            }
        }
    }
}
