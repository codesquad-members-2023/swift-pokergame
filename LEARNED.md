# 이미지뷰 

### 프로젝트에 이미지 리소스 추가하기 
- 원하는 이미지를 Drag and Drop 한다. 

<img width="264" alt="스크린샷 2023-03-15 오전 11 41 55" src="https://user-images.githubusercontent.com/88966578/225191566-3350b308-f8b6-49ea-8def-a5793a05f8e3.png">

* 이 옵션을 꼭 체크하길 바란다. 그래야 원본에 변화가 생겨도 영향을 받지않음. 

### Assets에 추가 , 배율의 의미 

- Drag and Drop으로 Aseets 내부에 이미지를 집어넣는다. 

<img width="225" alt="스크린샷 2023-03-15 오전 11 45 05" src="https://user-images.githubusercontent.com/88966578/225191852-80b4ce77-29a8-4b8c-ab9d-6ffd3009f243.png">

- 배율에 대한 세팅이 되어있지 않은 이미지의 경우 

<img width="625" alt="스크린샷 2023-03-15 오전 11 45 29" src="https://user-images.githubusercontent.com/88966578/225192269-bc49a853-a599-4af0-8635-f6aa290f57d8.png">

- 배율에 대한 세팅이 되어있는 이미지의 경우 

<img width="627" alt="스크린샷 2023-03-15 오전 11 48 09" src="https://user-images.githubusercontent.com/88966578/225192333-ca92dff1-6308-44fb-a60d-a265483ecae5.png">

- 1x , 2x , 3x , ... 이거 뭐하는거냐 ?
 크기가 작은 디바이스와 크기가 큰 디바이스에서 똑같은 이미지를 출력할 때를 생각해보자. 배율 세팅이 되어있지 않다면 , 큰 디바이스에서 보는 이미지는 상대적으로 저화질일 것이다. 이미지를 구성하는 픽셀수는 동일한데, 화면이 커져 버리니 이미지가 확대되어 출력되는 상황이 발생할 것이다. 
 
 혹은, 화면이 커짐에 따라 화질의 저하가 일어나는 것을 방지하기 위해 Image Processing 과정을 거치게 될 텐데, 이러한 계산과정을 제거하고자 Assets에 디바이스 크기에 따라 서로 다른 이미지를 사용 할 수 있도록 ***픽셀의 밀도가 다른 이미지를 저장해 놓는 기능***이다. 
 
 <img width="1510" alt="스크린샷 2023-03-15 오후 12 06 44" src="https://user-images.githubusercontent.com/88966578/225196025-1143a980-4337-490c-b946-7c7cffe8723c.png">

 **1x(좌) 와 3x(우)의 픽셀밀도 비교. 좌측의 이미지는 계단현상이 일어남

https://appicon.co/#image-sets 에서 배율에 따른 이미지를 생성할 수 있다. 

### 이미지 뷰 넣기 
  
```swift
let positionX = self.view.center.x - 150
let positionY = self.view.center.y - 150
        
guard let diamondImage = UIImage(named: "diamond") else {
    return
}
        
let diamondView = UIImageView(image: diamondImage)
        
diamondView.frame = CGRect(x: positionX , y: positionY, width: 300, height: 300)
        
self.view.addSubview(diaView)
``` 

<img width="391" alt="스크린샷 2023-03-15 오후 1 37 47" src="https://user-images.githubusercontent.com/88966578/225207907-4660a5d7-28c3-4e5b-a314-0dfa0101670d.png">

### Class vs Struct에 대한 기준 

### 나만의 기준 
 클래스의 핵심적인 특징 2개는 다음과 같다고 생각한다. 
  - 상속 가능
  - 참조 타입 
  
 따라서, 상속의 필요성 , 참조 타입을 써야하는 필요성이 있지 않다면 Struct로 가겠노라 선언하겠다. 
 예를 들어, 
 - 관계된 간단한 값을 캡슐화 하기 위한 것일 때
 - 인스터스가 참조되기 보다 복사되기를 바랄 때
 - 프로퍼티가 참조되기 보다 복사되기를 바랄 때
 - 프로퍼티나 메소드 등을 상속할 필요가 없을 때

 일때 나는 묻지도 따지지도 않고 Struct로 간다. 
 
### 두 타입의 차이점 
- 구조체는 value type, 클래스는 reference type 입니다.

  (구조체 : 대입할 때 복사가 일어나는 것이 아닌, 수정이 발생할 때 값이 복사됨)
- 구조체는 상속이 불가능합니다.
- 구조체에서는 AnyObject로 타입캐스팅이 불가능합니다.
- 구조체는 생성자를 구현하지 않을 시 기본 initializer를 사용할 수 있습니다.
- 클래스는 reference counting으로 메모리 관리가 가능합니다

# CustomStringCovertible 프로토콜 

### 애플 생태계에서는 toString , getString 같은 녀석들을 description 으로 쓴다. 
 
 그러기 위해서는 텍스트적인 표현을 커스터마이즈할 필요성이 생기는데 , 이는 CustomStringConvertible 프로토콜을 채택함으로써 가능해진다. 공식문서의 예제에 따르면 , 

```swift 
struct Point {
	let x: Int, let y: Int
}

let p = Point(x: 21, y: 30)

print(p)
// Prints "Point(x: 21, y: 30)"
```

CustomStringConvertible 프로토콜을 채택하면, 사용자가 정의한 형태로 출력이 되는 것을 확인할 수 있다.

```swift 
extension Point: CustomStringConvertible {
	var description: String {
    	return "(\(x), \(y))" // print시 출력되는 포맷을 지정할 수 있다. 
    }
}

print(p)
// Prints "(21, 30)"
```

# 접근제어(Access Control)

### Definition 

```
Access control restricts access to parts of your code from code in other source files and modules.
```
-> 다른 소스파일이나 모듈로부터 나의 코드의 일부분에 접근하는 것을 제한한다. 

* 이렇게 접근제어를 함으로써 특정 코드의 세부적인 구현을 감추고 딱 필요한 만큼 공개해 다른 곳에서 사용할 수 있도록 함.
* 접근제어는 클래스, 구조체, 열거형 등 개별 타입에도 적용할 수 있고 그 타입에 속한 프로퍼티, 메소드, 초기자, 서브스크립트에도 적용할 수 있다.

-> 모듈과 소스파일 

* 모듈은 코드를 배포하는 단일 단위로 하나의 프레임워크나 앱이 이 단위로 배포되고 다른 모듈에서 Swift의 import키워드를 사용해 import될 수 있다. Xcode의 각 빌드 타겟은 Swift에서 분리된 단일 모듈로 취급된다.
* 소스파일은 모듈안에 있는 소스파일을 의미한다. abc.swift 같은거.

### 왜 사용하는가 ? 

* Encapsulation : 액세스 제어를 사용하면 코드의 구현 세부 정보를 숨기고 코드의 다른 부분과 상호 작용하는 데 필요한 부분만 노출할 수 있다. 이렇게 하면 코드의 복잡성을 줄이고 유지 관리 및 업데이트를 쉽게 할 수 있다.

* Stability : 액세스 제어를 사용하면 코드의 공용 인터페이스를 표시할 수 있으므로 코드 동작이 의도하지 않게 변경되는 것을 방지할 수 있다. 잘 정의된 공용 인터페이스만 노출하면 코드의 다른 부분이 코드 기능을 손상시킬 수 있는 변경을 수행하지 않도록 할 수 있다.

* Security , Reusability

### Swift의 5가지 Access levels

 (특정 접근 제어자가 적용되는 대상을 entity로 서술한다. entity는 접근제어자를 작성할 수 있는 property, method, class, struct 등의 집합을 의미한다.)
 
* Open & Public : Open과 Public 접근자 모두 선언한 모듈이 아닌 다른 모듈에서 사용가능. 두 접근자의 차이점은 Open은 다른 모듈에서 오버라이드와 서브클래싱이 가능하지만 Public 접근자로 선언된 것은 다른 모듈에서는 오버라이드와 서브클래싱이 불가능.
* Internal : 기본 접근레벨로 아무 접근레벨을 선언하지 않으면 Internal로 간주됨. Internal레벨로 선언되면 해당 모듈 전체에서 사용 가능.
* File-private : 특정 엔티티를 선언한 파일 안에서만 사용 가능.
* Private : 특정 엔티티가 선언된 괄호({}) 안에서만 사용 가능.

### 일반적인 원칙 

* Swift에서 접근 레벨은 더 낮은 레벨을 갖고 있는 다른 엔티티를 특정 엔티티에 선언해 사용할 수 없다는 일반 가이드 원칙을 따른다.

### 유닛테스트 타겟을 위한 접근레벨 (Access Levels for Unit Test Targets)

* 기본적으로 open이나 public으로 지정된 엔티티만 다른 모듈에서 접근 가능.
* 유닛테스트를 하는 경우 모듈을 import할때 import앞에 @testable이라는 에트리뷰트를 붙여주면 해달 모듈을 테스트가 가능한 모듈로 컴파일해 사용.

### Shuffle algorithm

* Fisher-Yates Algorithm 

- 피셔-예이츠 셔플(Fisher-Yates shuffle)은 유한 수열의 무작위 순열을 생성하기 위한 알고리즘이다. 즉, 이 알고리즘은 수열을 무작위로 섞는다. 이 알고리즘은 먼저 모든 항목이 들어 있는 통에서 항목이 남아 있지 않을 때까지 항목을 무작위로 꺼내어 다음 항목을 선택한다. 이 알고리즘은 편향되지 않은 순열을 생성한다. 다시말해 모든 순열은 생성될 가능성이 동일하다. 과정은 다음과 같다. 

```
1) 1 부터 N 까지의 수를 쓴다.
2) 1과 지워지지 않고 남아 있는 수의 개수(포함) 사이의 임의의 수 k를 선택한다.
3) '작은 쪽부터 세어' 아직 지워지지 않은 k 번째 수를 지워서 '별도의 목록' 끝에 적어둔다.
4) 모든 수가 지워질 때까지 2단계부터 반복한다.
5) 3단계에서 기록한 일련의 수가 임의 순열이 된다.
```
이 방법의 단점은 과정 3)에 있다. 개수를 세는 계산과 , 별도의 목록을 생성하는 행위가 불필요하기 때문에 이를 개선한 현대판 Fisher-Yates Algorithm 이 탄생하였는데,
그것이 바로 Modern Fisher-Yates / Durstenfeld / Knuth Algorithm 이라고 불리는 것들이다. 
(셋다 이름만 다를 뿐 같은 내용이다.)

* Modern Fisher-Yates / Durstenfeld / Knuth Algorithm

```
1) 1 부터 N 까지의 수를 쓴다.
2) 1과 N 사이의 임의의 수 k를 선택한다.
3) 배열의 한쪽 끝인 N과 선택된 'k'를 스왑한다. 
4) 배열의 한쪽 끝을 N-1로 간주하고 반복한다.  
5) 배열의 다른 한쪽 끝까지 도달하면 셔플된 배열이 만들어진다. 
```
기존의 단점을 개선한 알고리즘으로, 원소의 개수를 세는 계산대신 배열인덱스를 이동시키면서 셔플한다. 그리고 또 다른 배열이 필요한게 아닌, 기존의 배열 공간에서 이루어진다. 
이는 복잡도 측면에서 기존의 알고리즘보다 우수한 성능을 보인다. 

* Example (Src : Wikipedia: https://ko.wikipedia.org/wiki/%ED%94%BC%EC%85%94-%EC%98%88%EC%9D%B4%EC%B8%A0_%EC%85%94%ED%94%8C )  

 이제 Durstenfeld의 알고리즘 버전 을 사용하여 동일한 작업을 수행해 보자. 이번에는 선택한 문자를 지우고 다른 곳에 복사하는 대신 아직 선택되지 않은 마지막 문자로 교체한다. 이전과 같이 A에서 H까지의 문자를 쓰는 것으로 시작한다.

<img width="226" alt="스크린샷 2023-03-19 오후 9 29 20" src="https://user-images.githubusercontent.com/88966578/226175207-1578ee5b-91b5-45f8-afaf-274ca0fc0822.png">

첫 번째 선택에서는 1에서 8까지 중 임의의 숫자를 선택한다. 이번에는 6이라고 치고 목록에서 6번째와 8번째 문자를 바꾼다.

<img width="209" alt="스크린샷 2023-03-19 오후 9 29 24" src="https://user-images.githubusercontent.com/88966578/226175228-0ecfd6c5-2d91-4c4d-b26c-37cd8d0d5403.png">


다음 난수는 1에서 7까지 중에 2가 선택되었다고 하자. 따라서 두 번째와 일곱 번째 문자를 바꾸고 계속 진행한다.

<img width="199" alt="스크린샷 2023-03-19 오후 9 29 28" src="https://user-images.githubusercontent.com/88966578/226175243-b74baa2f-7631-46bc-a69a-e8dbd4421c31.png">

다음 난수는 1에서 6이며, 6이 나왔다고 하자. 목록의 6번째 문자 H가 현재 선택되지 않은 마지막 글자이므로 교환 후에도 그대로이다. 그리고, 순열이 완료될 때까지 같은 방식으로 계속 진행한다.

<img width="236" alt="스크린샷 2023-03-19 오후 9 29 32" src="https://user-images.githubusercontent.com/88966578/226175260-e5c4ed63-91e6-4fc5-87c4-c1efc25d8188.png">

이 시점에서 더 이상 수행할 수 있는 것은 없으므로 결과 순열은 G E D C A H B F이다.

* 오름차순과 내림차순의 차이 

```swift
func shuffleDescending() {
    for i in stride(from: deck.count - 1, to: 0, by: -1) {
        let j = Int.random(in: 0...i)
        deck.swapAt(i, j)
    }
}

func shuffleAscending() {
    for i in 0..<deck.count {
        let j = Int.random(in: i..<deck.count)
        deck.swapAt(i, j)
    }
}
// 각 스왑 후에 나머지 섞이지 않은 카드의 인덱스를 업데이트해야 하므로 코드가 복잡해지고 읽기가 더 어려워진다.
// 그러나 체감은 비슷하다... 
```
