struct Card {
    // 구조체로 선언한 이유는 Card가 상속의 필요성이 없고,
    // 클래스보다 접근이나 메모리 관리가 효율적이기 때문입니다.
    
    // enum 타입으로 설정한 이유는 가독성면에서 좋기 때문입니다.
    enum Suit:String {
        case spade = "♠"
        case heart = "♥"
        case clover = "♣"
        case diamond = "♦"
    }
    
    enum Rank:Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case ace = 1
        case jack = 11, queen, king
    }
    
    private let suit:Suit
    private let rank:Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    func showInformation() -> String {
        var stringRank = ""
        switch self.rank {
        case .ace:
            stringRank = "A"
        case .jack:
            stringRank = "J"
        case .queen:
            stringRank = "Q"
        case .king:
            stringRank = "K"
        default:
            stringRank = String(self.rank.rawValue)
        }
        return self.suit.rawValue + stringRank
    }
}
