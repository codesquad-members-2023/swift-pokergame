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
    
    // 덱에 카드가 한장이거나 없을때 예외처리
    mutating func shuffle() throws {
        switch count() {
        case 0:
            throw CardDeckError.isEmpty
        case 1:
            throw CardDeckError.OneCard
        default:
            for index in 0..<deck.count-1 {
                let switchIndex = Int.random(in: index..<deck.count)
                deck.swapAt(index, switchIndex)
            }
        }
    }

    // 덱에 카드가 없을 때 예외처리
    mutating func removeOne() throws -> Card {
        guard count() != 0 else {
            throw CardDeckError.isEmpty
        }
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

// 에러 선언부는 메소드와 분리시켜 선언하는게 가독성이 좋다고 판단하여 확장부에 작성
extension CardDeck {
    // CardDeck에서만 사용하기에 Nested Enum Type으로 선언
    enum CardDeckError:Error {
        case isEmpty
        case OneCard
    }
}
