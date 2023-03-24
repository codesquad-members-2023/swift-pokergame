# UNIT TEST

[SRC : https://www.kodeco.com/21020457-ios-unit-testing-and-ui-testing-tutorial]

## 효과적인 Unit Test를 위한 간결한 기준세트 FIRST
 - Fast : 테스트가 빠르게 실행되어야 한다. 
 - Independent / Isolaterd : 테스트는 서로 상태를 공유해선 안된다. 
 - Repeatable : 테스트를 실행할 때마다 동일한 결과를 얻어야 한다. 
 - Self-validating : 테스트는 전히 자동화되어야 한다. 출력은 개발자의 해석에 의존하면 안되며 , 객관적으로 "통과" 혹은 "실패 " 여야한다. 
 - Timely : 이상적으로는 테스트하는 코드가 제품화 되기 전에 테스트가 되어야한다. 즉, 개발하면서 테스트가 이루어져야 한다. 


## Xcode에서 Unit Test 하기

### 1 ) 생성 및 실행법 
# ► Test Navigator 에서 ```New Unit Test Target``` 선택

<img width="234" alt="스크린샷 2023-03-21 오후 2 21 50" src="https://user-images.githubusercontent.com/88966578/226525005-b9ea850e-4d4b-467b-8fca-919f807190e1.png">

   # +) 자동생성 메소드의 역할 
   ***- setUpWithError***

   테스트에서 가장 먼저 실행되는 메소드로 보통 어떤 모델이나 시스템을 정의하는 역할을 합니다.

   ***- tearDown***

   테스트에서 가장 마지막에 실행되는 메소드로 보통 정의했던 것들 해제시키는 역할을 합니다.

   ***- testExample***

   테스트를 할 코드를 작성하는 역할을 합니다.

   ***- testPerformanceExample***

   성능을 테스트하고 코드의 실행 속도를 테스트하는 역할을 합니다.


* 테스트 클래스를 실행하는 방법 
  * Product ▸ Test or Command-U : 모든 테스트 클래스를 실행 
  * Test Navigator의 화살표 클릭
  <img width="234" alt="스크린샷 2023-03-21 오후 2 42 06" src="https://user-images.githubusercontent.com/88966578/226527276-88679dfe-1564-4ed8-b02b-e148ea01a4e8.png">

  * 다이아몬드 버튼 클릭 
  <img width="361" alt="스크린샷 2023-03-21 오후 2 42 26" src="https://user-images.githubusercontent.com/88966578/226527282-48d5584e-7a1e-491f-a5b3-2a5e77dfa1f4.png">
  
  * 테스트가 성공하면 다이아몬드가 녹색으로 바뀐다.
  <img width="372" alt="스크린샷 2023-03-21 오후 2 45 33" src="https://user-images.githubusercontent.com/88966578/226527617-1dd713f1-2b3d-4b89-8f66-35627940a4a2.png">

  * measure라인의 회색 다이아몬드를 누르면 test성능결과를 볼 수 있다. 

### 2) Test 준비 : XCTAssert를 사용하여 모델 테스트
* Test하고 싶은 모델을 가져와야한다. 
  * 모델이란 다음과 같다.
  ```
  모델(Model)
  어플리케이션이 무엇을 할 것인지 정의한다. 내부 비즈니스 로직을 
  처리하기 위한 역할을 한다. 즉, 데이터 저장소(ex. DB)와 연동하여
  사용자가 입력한 데이터나 사용자에게 출력할 데이터를 다룬다.
  특히, 여러 개의 데이터 변경 작업(ex. 추가, 변경, 삭제)를 하나의 
  작업으로 묶은 트랜잭션을 다루는 일도 한다. Model은 다른 컴포넌트들에 
  대해 알지 못한다. 자기 자신이 무엇을 수행하는지만 알고 있다.
  
  SRC: https://tecoble.techcourse.co.kr/post/2021-04-26-mvc/
  ```

# ► 모델을 ```프로젝트명+Tests.swfit``` 에 import 해준다. 

```swift
@testable import PokerGameApp
```

# ► ```프로젝트명+Tests.swfit``` 의 class 내부에 sut프로퍼티를 추가해준다. 

```swift
var sut : test대상 
//var sut : Deck!
```

# ► ```setUpWithError()``` 를 다음과 같이 바꿔준다.

* 이 테스트 클래스의 모든 테스트는 SUT 개체의 속성 및 메소드에 액세스할 수 있다.

```swift
    override func setUpWithError() throws {
        try super .setUpWithError()
        var sut : test대상 
        //sut = Deck()
    }
```

# ► ```tearDownWithError()``` 를 다음과 같이 바꿔준다.

```swift
    override func tearDownWithError() throws {
    sut = nil 
    try super .tearDownWithError()
    }

```

***참고 : 모든 테스트가 깨끗한 슬레이트로 시작되도록 SUT를 만들고 setUpWithError()릴리스하는 것이 좋다. ***


### 3) 준비 끝. 해보자. : 첫 번째 테스트 작성
 
* 테스트 메서드의 이름은 항상 test 로 시작 하고 테스트 대상에 대한 설명이 뒤따른다.

* 테스트를 3가지 섹션 으로 형식화하는 것이 좋다 .

```
  * given (arrange) : 여기에서 테스트에 필요한 클래스나 객체 등을 나열한다.
  * when (action) : 테스트를 진행할 어떠한 행동을 나타낸다.
  * then (assert) : Act를 XCAssert에서 실행합니다.테스트가 실패할 경우 인쇄되는 메시지와 함께 예상 결과를 주장하는 섹션이다.
```
# ► func 작성 
  
<img width="637" alt="스크린샷 2023-03-21 오후 4 06 57" src="https://user-images.githubusercontent.com/88966578/226538453-b1540a1c-8615-44d2-b445-6e1e704a183d.png">

 * 52장의 덱에서 ```removeOne()``` 을 하고 ```count()```를 하면 51장이다. Then 파트에 52가 아닌 다른 값을 입력하면 Test에 실패 한다. 

 * XCTAssertEqual 말고도 많다. 쓰임새에 따라 다른걸 써보도록 하자. 

 ```swift
// Commonly used XCTest methods in Swift Unit Testing

XCTAssert(condition: Bool, _ message: String = "") 
// 이 메소드는 지정된 조건이 참인지 확인. 조건이 거짓이면 테스트가 실패합.

XCTAssert(condition:!condition, message)
XCTAssertFalse(condition: Bool, _ message: String = "")
// 테스트를 통과하려면 조건이 거짓이어야 한다.

XCTAssertEqual<T: Equatable>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: String = "")
// 이 메소드는 두 expression이 동일한지 확인한다. 이 값이 동일하지 않으면 테스트가 실패한다.

XCTAssertNotEqual<T: Equatable>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: String = "")
// 이 메소드는 두 expression이 동일하지 않은지 확인한다. 이 값이 동일하면 테스트가 실패한다.

XCTAssertNil(_ expression: @autoclosure () throws -> Any?, _ message: String = "")
// 이 메소드는 expression이 nil인지 확인한다. expression이 nil이 아닐 경우 테스트가 실패한다.

XCTAssertNotNil(_ expression: @autoclosure () throws -> Any?, _ message: String = "")
// 이 메소드는 expression이 nil이 아닌지 확인한다. expression이 nil일 경우 테스트가 실패한다.

XCTAssertThrowsError(_ expression: @autoclosure () throws -> Any, _ message: String = "")
// 이 메소드는 expression이 error를 throw 하는지 확인한다. 만약 error를 throw하지 않으면 테스트가 실패한다.
 ```

### 4) Faking Objects and Interactions

* 대부분의 앱은 제어할 수 없는 시스템 또는 라이브러리 개체와 상호 작용한다. 이러한 개체와 상호 작용하는 테스트는 느리고 반복 불가능하여 FIRST 원칙 중 두 가지를 위반할 수 있다. 대신 Stub 에서 입력을 받거나 모의 개체를 업데이트하여 상호 작용을 가짜로 만들 수 있다.

* 코드가 시스템 또는 라이브러리 개체에 대한 종속성이 있는 경우 가짜를 사용합니다. 가짜 개체를 만들어 해당 부분을 재생하고 이 가짜 개체를 코드에 주입하면 됩니다.

### 5) Stub에서 가짜 입력

* 다음기회에 업데이트. 
