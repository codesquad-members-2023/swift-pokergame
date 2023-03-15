# swift-pokergame

# 기능요구사항
## 1. 게임보드 만들기
- [x] StatusBar 스타일 설정하기
- [x] StackView 사용하지 않고 7등분
- [x] 이미지 패턴 설정
- [x] 앱 표시 이름 변경하는법

## 2. 카드 클래스 구현하기
- [x] 카드 클래스 구현
- [x] 이름 규칙 생각하기
- [x] 카드 객체 하나 만들어서 출력해보기

## 3. 카드덱 구현하고 테스트하기
- [x] struct, class 속성 차이점 확인
- [ ] 참조 접근자 활용하기
- [ ] count
- [ ] shuffle(로직 직접 구현)
- [ ] removeOne
- [ ] reset
- [ ] 동작 확인 코드 작성

 # 주요 작업 내용
 ## Step2-1. 게임보드 만들기
 ### 1. StatusBar 스타일 변경
 <img width="300" alt="image" src="https://user-images.githubusercontent.com/70703326/224629397-d78aa90d-1453-401e-ae80-fb1635a11b1e.png">  
<img width="300" alt="image" src="https://user-images.githubusercontent.com/70703326/224628660-d23e7bc8-6262-4575-9cf3-47e3e8c4386d.png">   

```
Status bar style | Light Content
View controller-based status bar appearance | NO
```
info.plist에서 두 가지 프로퍼티 추가하여 Status bar 스타일을 Light Content로 변경하였습니다. 하얀 글자로 표시됩니다.

### 2. 배경, 카드 이미지 뷰 추가
<img width="300" alt="image" src="https://user-images.githubusercontent.com/70703326/224710861-963a153b-7796-4115-a906-068f2169a6e9.png">
<img width="300" alt="image" src="https://user-images.githubusercontent.com/70703326/224733692-abc088af-f592-4e93-baf2-b16c0e8f2cc4.png">
<img width="300" alt="image" src="https://user-images.githubusercontent.com/70703326/224734282-85e435e2-bbb7-48e3-9539-f5c39a5877ad.png">


```swift
func placeCards(number: Int, spacing: CGFloat, atPointX startPointX: CGFloat, atPointY pointY: CGFloat) {
        // card만의 width를 모두 합한 값
        let widthWithoutSpacing = UIScreen.main.bounds.size.width - spacing * (CGFloat(number) + 1)
        let cardWidth: CGFloat = widthWithoutSpacing / CGFloat(number)
        let cardHeight: CGFloat = cardWidth * 1.27
        var pointX = startPointX
        
        for _ in 0..<number {
            var imageView : UIImageView
            imageView  = UIImageView(frame:CGRectMake(pointX, pointY, cardWidth, cardHeight));
            imageView.image = UIImage(named:"card-back.jpg")
            self.view.addSubview(imageView)
            pointX += cardWidth + spacing
        }
    }
```
number는 카드의 개수, spacing은 뷰 양끝 여백과 카드간 간격, atPointX와 atPointY는 첫 카드가 놓여지는 좌표입니다. 이미지는 순서대로 iPhone14PRO로 카드 7개일 때, 4개일 때, iPhoneSE 카드 4개일 때 입니다. type check 오류 때문에 cardWidth를 구하는 데애 widthWithoutSpacing 변수를 추가하는 단계가 필요했습니다.

### 3. 피드백 이후 수정한 부분
**A. 강제언래핑 부분 수정**

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
    }
    
    func setBackground() {
        if let patternImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: patternImage)
        } else {
            print("UIImage named \"bg_pattern\" is not found.")
        }
    }
```
강제언래핑 부분을 옵셔널 바인딩으로 변경하였습니다.  

**B. 뷰 관련 상수 선언하기** 
```swift
let cardCount: Int = 7
let spacing: CGFloat = 1
```
이전에 placeCards 메소드에서 인수를 직접 수로 받았던 부분을 수정했습니다. 뷰와 관련된 상수라는 점에 서 상수로 선언했습니다.

**C. placeCards 파라미터 변경**
* atPointX와 atPointY pointY -> startAt: (CGFloat, CGFloat)
* number -> count
* pointX -> atX
파라미터명을 일부 변경하였고, 읽기 쉽게하기 위해 x, y좌표를 따로 받는 것이 아닌 튜플로 하나의 좌표를 받을 수 있도록 했습니다. CGPoint는 Int, Double만 가능해서 사용할 수 없었던 점이 아쉬웠습니다. 

**D. placeCards 메소드 로직 일부 수정**
```swift
var imageView: UIImageView
func placeCards(count: Int, spacing: CGFloat, startAt point: (CGFloat, CGFloat)) {
    // for문 밖으로 이동
        var imageView: UIImageView
        for _ in 0..<count {
            // var imageView: UIImageView 본래 위치
            imageView  = UIImageView(frame:CGRectMake(pointX, pointY, cardWidth, cardHeight))
            imageView.image = UIImage(named:"card-back.jpg")
            self.view.addSubview(imageView)
            pointX += cardWidth + spacing
        }
    }
```
imageView 변수를 한번만 생성할 수 있도록 변경했습니다.  

***
## Step2-2. 카드 클래스 구현하기

### 1. Card 클래스
```swift
class Card {
    private let shape: Shape
    private let rank: Rank
    
    init(shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
}
```
shape, rank의 enum으로 구현

### 2. Card 출력하기
```swift
//Card내 메소드
func returnShape() -> String { shape.rawValue }
func returnRank() -> String { rank.rawValue }
///ViewController내 메소드
func printCard(_ card: Card) {
        print("\(card.returnShape())\(card.returnRank())")
    }
```
***
## Step2-3. 카드덱 구현하고 테스트하기