# swift-pokergame

# 기능요구사항
## 1. 게임보드 만들기
- [x] StatusBar 스타일 설정하기
- [x] StackView 사용하지 않고 7등분
- [x] 이미지 패턴 설정
- [ ] 앱 표시 이름 변경하는법

## 2. 카드 클래스 구현하기
- [ ] 카드 클래스 구현
- [ ] 이름 규칙 생각하기
- [ ] 카드 객체 하나 만들어서 출력해보기

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

```swift
func placeCards(number: Int, width: CGFloat, spacing: CGFloat, atPointX startPointX: CGFloat, atPointY: CGFloat) {
        let cardHeight: CGFloat = width * 1.27
        var pointX = startPointX
        
        for _ in 0..<number {
            var imageView : UIImageView
            imageView  = UIImageView(frame:CGRectMake(pointX, atPointY, width, cardHeight));
            imageView.image = UIImage(named:"card-back.jpg")
            self.view.addSubview(imageView)
            pointX += width + spacing
        }
    }
```
number는 카드의 개수, width는 카드의 너비, spacing은 카드간 간격, atPointX와 atPointY는 카드가 놓여지는 좌표입니다. iPhone14 pro에 한해 width 55가 가장 적절하다고 판단했으며, 테스트 기기에 따라 결과가 다를 것입니다. 


