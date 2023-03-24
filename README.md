
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

[UnitTest.md](https://github.com/HG-SONG/swift-pokergame/blob/main/UnitTest.md) 에 정리하였다. 

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
 
### STEP 4

i. 클래스 다이어그램

<img width="700" alt="스크린샷 2023-03-24 오전 11 09 23" src="https://user-images.githubusercontent.com/88966578/227406362-22b62959-2844-4167-a09b-96d864b5aca7.png">

ii. 각 클래스별 역할

* GameSetting : 게임을 시작할 때 필요한 정보들을 다룬다. 게임모드 , 플레이어 리스트 제어 등의 기능을 한다. 
    
* PhaseController : 게임의 전체적인 흐름을 다룬다. 
    
* Player : 게임에 참여하는 모든 플레이어들이 공통으로 가지는 옵션들을 다룬다. 각 게이머의 손에 들고있는 패는 private으로 선언하였고 , 나머지 실제 포커에서도 눈으로 확인할 수 있는 플레이어 리스트, 점수 등은 굳이 접근제어를 걸지 않았다. 

  * Dealer : 플레이어 클래스를 수퍼클래스로 두고있는 클래스이며, 딜러 역할을 한다. 생성된 덱을 받아 섞고, 뽑고, 각 플레이어 에게 분배하는 역할을 한다. 
  
  * Participant : 플레이어 클래스를 수퍼클래스로 두고있는 클래스이며, 게임에 참여하는 게이머 중 딜러를 제외한 일반 게이머를 의미한다. 
  
* Card : 카드 역할 부여. 모양과 숫자에 대한 정보를 가지고 있다. 

* Deck : 카드뭉치 역할 부여. [Card] 형태이며 이를 조작할 수 있는 기능을 모아놨다. 

iii. UnitTest 

* 테스트 대상 설정 
 
 * STEP4에서 구현해야 할 내용을 요약하자면 , " 모드와 인원수에 따라 모든 플레이어에게 카드를 오류없이 분배하라 " 정도로 생각할 수 있다. 그렇다면 테스트에서 고려되어야 할 내용은 
 
 1) 5Stud , 7Stud 에서 
 2) 참가자 1명 ~ 4명 일 때 ,  
 3) 모든 플레이어의 hand에 카드들이 중복없이 
 4) 알맞은 개수로 들어갔는가 
 를 체크하면 된다고 판단했다. 
 
 Player 클래스에 isHavingProblemInHand5Stud() , isHavingProblemInHand7Stud() 메소드를 추가하였고 , 이 두 메소드는 모드에 따라 맞는 개수가 player들에게 분배되었는지 , 분배된 카드 중에 중복된 카드가 있는지 체크하여 ***문제가 있다고 판단되면 true를 리턴한다.*** 모든 케이스가 이 메소드에서 false를 리턴하면 문제 없음. 테스트 통과.  



