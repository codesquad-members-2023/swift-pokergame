# swift-porkergame

## 체크리스트

### step1
- [x] iOS 프로젝트 기본 App 템플릿으로 하고 프로젝트 이름을 "PokerGameApp"으로 지정
- [x] statusBar 스타일 LightContent 지정
- [x] 이미지 파일 추가하여 배경, 카드 이미지 설정
- [x] viewController 클래스 수정
    - [x] 코드로 UIImageView 7개 생성
    - [x] 화면크기에 맞게 7개를 균등분배
- [ ] 해당 기능에 대한 pr 보낸 이후 뷰 7개 StackView를 이용해서 다시 구현
- [x] info.plist를 이용하여 앱 표시 이름 변경
### 작업 결과 화면
<img width="432" alt="Screenshot 2023-03-17 at 12 02 40 AM" src="https://user-images.githubusercontent.com/57861751/225659119-7a42176a-8627-4b1e-96ea-deb1e6ed22c1.png">

### 완성 날짜 = 03.16

### step2
- [x] step1 피드백 반영 후 코드 리팩토링
- [x] 카드 클래스 설계
    - [x] 확장을 고려해서 설계 진행
    - [x] 이름에 대한 규칙 정하기
- [x] 특정 카드 인스턴스 객체 콘솔 출력
- [x] 데이터와 출력 담당하는 코드 분리

### 작업 결과 화면
<img width="551" alt="Screenshot 2023-03-19 at 12 36 34 AM" src="https://user-images.githubusercontent.com/57861751/226115663-1faa39b7-4144-4b20-b4c1-ccc980d5494f.png">

### 완성 날짜 = 03.18

### step3
- [x] step2 피드백 반영
- [x] 카드덱 구조체 설계
- [x] 카드덱 멤버변수, 함수 구현
- [x] 테스트 코드 작성
- [x] knuth shuffle 구현
### 작업 결과 화면
<img width="868" alt="Screenshot 2023-03-20 at 5 25 36 PM" src="https://user-images.githubusercontent.com/57861751/226285029-a1f9920f-989b-4d45-adb2-c9f0c51680cf.png">

### 완성 날짜 = 03.20
