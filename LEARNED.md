### 이미지뷰 

# * 프로젝트에 이미지 리소스 추가하기 
- 원하는 이미지를 Drag and Drop 한다. 

<img width="264" alt="스크린샷 2023-03-15 오전 11 41 55" src="https://user-images.githubusercontent.com/88966578/225191566-3350b308-f8b6-49ea-8def-a5793a05f8e3.png">

* 이 옵션을 꼭 체크하길 바란다. 그래야 원본에 변화가 생겨도 영향을 받지않음. 

# * Assets에 추가 , 배율의 의미 

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

# * 이미지 뷰 넣기 
  
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



