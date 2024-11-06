@Entry
@Component
struct test {
  @State angleA:number = 0
  @State angleB:number = -35
  @State widthA:number = 200
  @State heightA:number = 200
  @State flexFlag:boolean = false
  @State img:string = 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.jpg'
  onPageShow():void{
    animateTo ( {
      duration: 5000,
      iterations: -1,
      curve:Curve.Linear
    }, () => {
      this.angleA = 360
      this.angleB = -45
    } )
  }
  build() {
    Stack() {
      Row(){
        // 唱针
        Image($r('app.media.ic_stylus'))
          .width(200)
          .aspectRatio(1)
          .rotate({
            x: 0,
            y: 0,
            z: 1,
            angle: this.angleB,
            centerX:40,
            centerY:30,
          })
      }
      .border({width:2, color:Color.Green})
      .justifyContent(FlexAlign.Start)
      .margin({bottom:'95%'})
      .zIndex(1)

      Row(){
        // 中心旋转
        Image(this.img)
          .borderRadius(400)
          .width(200)
          .backgroundColor('#ffc44f4f')
          .rotate({
            x: 0,
            y: 0,
            z: 1,
            angle: this.angleA,
            centerX: 100,
            centerY: 100,
          })
        }.width(204)
          .border({width:2, color:Color.Red})
          .margin({bottom:'90%', left:'40%', right:'40%'})
          .zIndex(0)
      /*
        // 空翻
        Column(){}
        .width(200)
        .height(200)
        .backgroundColor('#ffc44f4f')
        .rotate({
          x: 1,
          y: 0,
          z: 0,
          angle: this.angleA,
          centerX:100,
          centerY:0,
        })
        Text('空翻')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({bottom:10,top:10})
      */
      /*
      // 旋转缩放
        Text('旋转缩放')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({bottom:10,top:10})

        Column(){}
        .border({width:2, color:Color.Green})
        .width(this.widthA)
        .height(this.heightA)
        .backgroundColor('#ffc44f4f')
        .rotate({
          x: 0,
          y: 0,
          z: 1,
          angle: this.angleA,
          centerX:200,
          centerY:200,
        })
      */
    }
    .width('100%')
    .height('100%')
    .backgroundImage(this.img)
    .backgroundImageSize(ImageSize.Cover)
    .backgroundBlurStyle(BlurStyle.BACKGROUND_ULTRA_THICK)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}
