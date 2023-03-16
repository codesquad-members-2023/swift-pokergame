# ❗️swift-porkergame❗️
2주차 포커게임 프로젝트

 - - -
학습파일 바로가기 >>>> https://github.com/boriiiborii/baekjun/files/10954769/STUDY.md
- - -
# ❗️체크리스트❗️
2-1
- [x] ViewController 클래스에서 self.view 배경을 다음 이미지 패턴으로 지정. 이미지 파일은 Assets에 추가
<img src="https://user-images.githubusercontent.com/97685264/224651784-b7b55fce-70bb-4f31-b9f1-eba36af76641.png">

- [x] ViewController 클래스에서 코드로 7개 UIImageView를 생성하고, 카드뒷면 이미지 연결
- [x] 카드 가로와 세로 비율은 1:1.27로 지정
<img src="https://user-images.githubusercontent.com/97685264/224711464-d00e1927-92c7-465b-aebb-ec5a2d610a67.png">

- [x] 앱 기본 설정(Info.plist)을 변경하는 방식에 대해 학습하고 앱 표시 이름을 변경
<img src="https://user-images.githubusercontent.com/97685264/224711801-9416f0ee-99d3-4d22-a392-1f2c6910cab5.png">

2-2
- [x] 객체지향 프로그래밍 방식에 충실하게 카드 클래스(class)를 설계
- [x] 카드 정보를 출력하기 위한 문자열을 반환하는 함수를 구현
- [x] ViewController에서 특정한 카드 객체 인스턴스를 만들어서 콘솔에 출력
<img src="https://user-images.githubusercontent.com/97685264/224928185-8a482830-0d0a-4c60-a3ec-ff8c11408038.png">

2-3
- [x] 구조체(struct)와 클래스(class) 차이점을 학습, 속성이 바뀔때 어떠한 변화가 있는가 (학습-1)
- [x] 참조 접근자를 활용해서 정보를 감추고 메소드 인터페이스를 통해 접근하는 방식을 학습 (학습-2)
- [x] 다양한 shuffle 알고리즘에 대해 찾아본다 (학습-3)
- [x] 앞서 만든 모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현
- [x] 내부 속성을 모두 감추고 다음 인터페이스만 보이도록 구현. count shuffle removeOne reset
- [x] 상위 모듈에서 카드덱 기능을 확인할 수 있도록 테스트 코드를 추가(카드덱 함수를 호출해서 원하는 데로 동작하는지 확인할 수 있는 코드를 작성)

2-4
- [x] 딜러와 참가자를 포함하는 pokerGame 객체 작성
- [] 딜러와 유저에게 카드를 나눠주는 코드 작성
- [ ] XCTest를 위한 테스트타깃 작성
- [ ] 테스트 코드에서 pokerGame 메소드를 호출하여 동작 확인

