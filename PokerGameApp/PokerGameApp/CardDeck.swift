// 덱은 미션을 끝까지 봤을 때 하나만 구현해도 된다고 생각하였고
// 상속이나 재사용성을 활용할 경우가 없다 생각하여 구조체로 선언
struct CardDeck {
    private var deck:[Card] = []
    // count메소드 대신 편리성 및 중복 메소드 없애기 위해 계산 프로퍼티를 사용
    var count:Int {
        return deck.count
    }

    // 초기화와 동시에 54장의 카드를 가지도록 의도하여 reset 메소드를 호출 함
    init() {
        reset()
    }
    
    // 덱에 카드가 한장이거나 없을때 예외처리
    mutating func shuffle() throws {
        switch count {
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
        guard deck.count > 0 else {
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

// 오류처리시 GameViewController에서 사용해야하기에
// Nested Enum -> Enum으로 수정
enum CardDeckError:Error {
        case isEmpty
        case OneCard
}

