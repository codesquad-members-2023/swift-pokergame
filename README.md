
# swift-pokergame
## 체크리스트
### 게임보드 만들기 

- Asset에 이미지 추가하고 갖고 놀아보기    
- 화면 크기 고려해서 정교하게 View 구성해보기 
- 코드로 화면 컨트롤 하기
- 이미지를 타일처럼 배경에 설정하기
- 구현시 Force unwrapping 사용하지 않기 
- info 변경 ? 
    
### 카드 클래스 구현
   
- nested enum ? 
- OOP 설계
   - 데이터타입 선택 
   - 다이어그램 그려보기 
   - SOLID 원칙에 최대한 부합하게 
   - 설계에 있어서 나만의 기준이나 명확한 이유가 존재했으면 좋겠음.
   - "어디까지 생각하고 구현시작해야하나?"에 대한 나만의 문턱지점을 실험할 수 있었으면 좋겠음.
   - 지금 완벽할 순 없다. 너무 많은 시간을 쏟진 말것. 
        
### 카드덱 구현 , 테스트 
   
- 메모리와 객체 
- 메모리 분석도구 
- 테스트코드
        
### 게임로직 구현 

- TDD방법론에 대하여 
        
### 포커게임 화면 
### 승자 표시하기 

## 학습

[LEARNED.md](https://github.com/HG-SONG/swift-pokergame/blob/main/LEARNED.md) 에 정리하였다. 
 
## 구현
 
### STEP 1

* 이미지 다운로드 후 프로젝트에 추가 
   
" 리소스 파일을 추가할 때는 Copy 옵션을 꼭 지정하고 Target을 체크되어 있는지 확인한다. "
    
copy옵션을 자정하지 않으면 원본을 그대로 프로젝트에 포함시키기 때문에 , 원본의 이동이나 삭제가 일어나면 프로젝트에서도 쓸 수 없게 되어 버린다. 

* 이미지를 타일화하여 배경으로 설정 
```swift
self.view.backgroundColor = UIColor(patternImage: pattern)
```

* 카드 뒷면 이미지뷰 배치 
  
  i. 조건에 필요한 변수 선언 
```swift
let cardBack : UIImage? = UIImage(named: "card-back")
let boundaryWidth = self.view.bounds.width
var posX = 2.0 // X좌표 시작 위치 
let posY = 50.0 // Y좌표 시작 위치 
let padding = 2.0 // 카드와 카드 사이 간격
let cardWidth = boundaryWidth/7 - (2*padding)
let cardHeight = cardWidth * 1.27
```
   ii. 이미지뷰 생성 , 추가 
```swift
let cardBackView = UIImageView(image: img)
cardBackView.frame = CGRect(x: posX , y: posY, width: cardWidth, height: cardHeight)
self.view.addSubview(cardBackView)
posX += cardWidth + (2*padding)
```
   iii. 두 단계를 메소드로 쪼개서 viewDidLoad()에 넣어준다. 

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    setCardBack()
}
```
   iv. StatusBar 스타일 변경 
   
   UIKit의 preferredStatusBarStyle 재정의해서 사용 
```swift
override var preferredStatusBarStyle: UIStatusBarStyle {
     return .lightContent
}
```
  v. 결과화면 
  
  <img width="393" alt="스크린샷 2023-03-14 오후 5 15 45" src="https://user-images.githubusercontent.com/88966578/224947786-47e5dd0b-4366-4d75-8f62-e761285f1b62.png">

### STEP 2 

i. Card Struct 
 
 지금 당장은 상속의 필요성이 느껴지지 않아서 class가 아닌 struct를 선택. 
 카드의 속성인 Shape과 Rank는 Enum으로 정의하였다. 같은 주제로 연관된 데이터의 집합이고 입력받을 값을 미리 특정할 수 있는 것들이기에 적합다고 생각했다.
 
ii. CustomStringConvertible 프로토콜
 
 객체정보를 출력할때 내가 원하는 포맷으로 출력하기 위해 CustomStringConvertible를 채택하였다.
 
```swift
extension Card: CustomStringConvertible {
    var description : String {
        return "\(self.shape.rawValue)\(self.rank.description())"
    }
}
```

### STEP 3

i. Deck struct
    
   * Card객체로 구성된 Array를 프로퍼티(private)로 갖고, 그 Array에 접근하는 함수들을 몇가지 가지고 있다. 
    
 - func count() : 현재 Deck에 들어있는 Card객체가 몇개인지 return한다. 
 - func reset() : 52개의 Card객체를 Deck에 넣는다.
 - func removeOne() : Deck에 들어있는 Card객체 1개를 return하고 제거한다. 즉, 카드를 뽑는 기능 
 - func shuffle() : Deck에 들어있는 Card객체를 섞어준다.  
 
