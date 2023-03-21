# UNIT TEST

[SRC : https://www.kodeco.com/21020457-ios-unit-testing-and-ui-testing-tutorial]

## 효과적인 Unit Test를 위한 간결한 기준세트 FIRST
 - Fast : 테스트가 빠르게 실행되어야 한다. 
 - Independent / Isolaterd : 테스트는 서로 상태를 공유해선 안된다. 
 - Repeatable : 테스트를 실행할 때마다 동일한 결과를 얻어야 한다. 
 - Self-validating : 테스트는 ㅇ돤전히 자동화되어야 한다. 출력은 개발자의 해석에 의존하면 안되며 , 객관적으로 "통과" 혹은 "실패 " 여야한다. 
 - Timely : 이상적으로는 테스트하는 코드가 제품화 되기 전에 테스트가 되어야한다. 즉, 개발하면서 테스트가 이루어져야 한다. 


## Xcode에서 Unit Test 하기

### 1 ) 생성 및 실행법 
* <span style="color:red">Test Navigator 에서 ```New Unit Test Target``` 선택</span>
<img width="234" alt="스크린샷 2023-03-21 오후 2 21 50" src="https://user-images.githubusercontent.com/88966578/226525005-b9ea850e-4d4b-467b-8fca-919f807190e1.png">

* 테스트 클래스를 실행하는 방법 
  * Product ▸ Test or Command-U : 모든 테스트 클래스를 실행 
  * Test Navigator의 화살표 클릭
  <img width="234" alt="스크린샷 2023-03-21 오후 2 42 06" src="https://user-images.githubusercontent.com/88966578/226527276-88679dfe-1564-4ed8-b02b-e148ea01a4e8.png">

  * 다이아몬드 버튼 클릭 
  <img width="361" alt="스크린샷 2023-03-21 오후 2 42 26" src="https://user-images.githubusercontent.com/88966578/226527282-48d5584e-7a1e-491f-a5b3-2a5e77dfa1f4.png">
  
  * 테스트가 성공하면 다이아몬드가 녹색으로 바뀐다.
  <img width="372" alt="스크린샷 2023-03-21 오후 2 45 33" src="https://user-images.githubusercontent.com/88966578/226527617-1dd713f1-2b3d-4b89-8f66-35627940a4a2.png">

  * measure라인의 회색 다이아몬드를 누르면 test성능결과를 볼 수 있다. 

### 2) XCTAssert를 사용하여 모델 테스트
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

* 모델을 ```프로젝트명+Tests.swfit``` 에 import 해준다. 

```swift
@testable import PokerGameApp
```
