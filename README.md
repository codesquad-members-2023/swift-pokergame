# swift-porkergame
## 추가 학습
- [x] AppDelegate와 SceneDelegate 학습하기
- [ ] Xcode 단축키

## 1. 게임보드 만들기
- [x] StatusBar 스타일을 LightContent로 하기
- [x] image 추가하기
- [x] content mode 학습하기
- [x] UIStackView에 대해 학습하기
- [x] 앱 기본 설정(Info.plist)을 변경하는 방식에 대해 학습하고 앱 표시이름 변경하기
![image](https://user-images.githubusercontent.com/115064144/226177573-6c2b1bed-249f-44e7-b068-8f6b21b2c61a.png)

## 2. 카드 클래스 구현하기
- [x] 객체지향 프로그래밍 방식에 충실하게 카드 클래스(class)를 설계하기
- [x] 카드 정보를 출력하기 위한 문자열을 반환하는 함수를 구현하기
- [x] 클래스 이름, 변수 이름, 함수 이름에서 자신만의 규칙 먄들기
- [x] 유니코드에 대해 학습하기
<img width="582" alt="스크린샷 2023-03-21 오후 4 25 35" src="https://user-images.githubusercontent.com/115064144/227180477-a4e96c71-fbe1-4219-8e43-b7cac4ae21c9.png">

## 3. 카드덱 구현하고 테스트하기
- [x] 앞에서 구현한 모든 종류의 Card 인스턴스를 포함하는 CardDeck 구조체 구현하기
- [x] count를 가지고 있는 카드 개수 반환
- [x] shuffle 메서드 구현
- [x] removeOne 메서드 구현
- [x] reset 메서드 구현
- [x] 예상 결과를 호출하고 출력하는 테스트 시나리오 구현
<img width="611" alt="스크린샷 2023-03-23 오후 7 03 13" src="https://user-images.githubusercontent.com/115064144/227180613-9970226b-6a92-4663-92b2-acc8b21c5f6f.png">

## 4. 게임 로직 구현하기
- [ ] 카드 덱을 활용해서 카드를 나눠주는 Dealer 설계
- [ ] 카드를 받는 Participant 설계
- [ ] Dealer와 Participant를 포함하는 PokerGame 객체 작성
- [ ] XCTest 단위 테스트 구현
- [ ] 참가자 이름 랜덤하게 설정하는 로직 구현하기