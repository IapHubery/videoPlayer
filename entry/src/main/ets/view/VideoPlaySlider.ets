import font from '@ohos.font';
/**
 * 视频滑块组件
 */
@Component
export struct VideoSlider{
  // @Consume isOpacity: boolean;  //亮度
  private controller: VideoController = new VideoController();
  @Consume currentStringTime: string;
  @Consume currentTime: number;
  @Consume durationTime: number;
  @Consume durationStringTime: string;
  @Consume isPlay: boolean;
  @Consume playMode: 0 | 1 | 2;
  @Consume flag: boolean;
  @Consume isLoading: boolean;
  @Consume progressVal: number;

  aboutToAppear(): void {
    font.registerFont({
      familyName:'myIconFont',
      familySrc:'/fonts/iconfont.ttf'
    })
  }

  build() {
    Column(){
      Blank()
      // 视频进度条
      Row({ space: 12 }) {
        Text(this.currentStringTime)
          .fontSize(16)
          .fontColor(Color.White)
          .margin({ left: 12 })

        Slider({
          value: this.currentTime,
          min: 0,
          max: this.durationTime,
          step: 1,
          style: SliderStyle.OutSet
        })
          .blockColor('#FFFFFF')
          .width('65%')
          .trackColor(Color.Gray)
          .selectedColor('#FFFFFF')
          .showSteps(true)
          .showTips(true)// .trackThickness(this.isOpacity ? 2 : 4)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.sliderOnchange(value, mode);
          })

        Text(this.durationStringTime)
          .fontSize(16)
          .margin({ right: 12 })
          .fontColor(Color.White)
      }
      // .opacity(this.isOpacity ? 0.2 : 1)
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)

      //播放控制
      Row()  {
        // 播放模式 0 顺序,1 随机,2 循环
        Text(this.playMode === 0?'\ue6f0':this.playMode === 1?'\ue6a0':'\ue68f')
          .fontFamily('myIconFont')
          .fontColor(Color.White)
          .fontSize(32)
          .onClick(()=>{
            // 切换播放模式
            this.playMode++
            if (this.playMode > 2) {
              this.playMode = 0
            }
          })
        //  上一曲
        Text('\ue63c')
          .fontFamily('myIconFont')
          .fontColor(Color.White)
          .fontSize(32)
        // 播放/暂停
        Text(this.isPlay?'\ue62b':'\ue624')
          .fontFamily('myIconFont')
          .fontColor(Color.White)
          .fontSize(50)
          .onClick(() => {
            this.iconOnClick();
          })
        //  下一曲
        Text('\ue63e')
          .fontFamily('myIconFont')
          .fontColor(Color.White)
          .fontSize(32)
        // 播放列表
        Text('\ue603')
          .fontFamily('myIconFont')
          .fontColor(Color.White)
          .fontSize(32)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('90%')
      .padding(10)
    }
    .height(110)
    // .border({width:2, color: Color.Green})
  }

  /**
   * 图标点击回调
   */
  iconOnClick() {
    if(this.isPlay === true) {
      this.controller.pause()
      this.isPlay = false;
      // this.isOpacity = false;
      return;
    }

    if(this.flag === true) {
      this.controller.start();
      this.isPlay = true;
      // this.isOpacity = true;
    } else {
      this.isLoading = true;
      //  视频加载未完成，加载事件显示
      let intervalLoading = setInterval(() => {
        if(this.progressVal >= 100) {
          this.progressVal = 0
        } else {
          this.progressVal += 10
        }
      }, 100)
      //计划任务确定视频加载是否完成。
      let intervalFlag = setInterval(() => {
        if(this.flag === true) {
          this.controller.start();
          this.isPlay = true;
          // this.isOpacity = true;
          this.isLoading = false;
          clearInterval(intervalFlag);
          clearInterval(intervalLoading);
        }
      }, 100)
    }
  }

  /**
   * 视频滑块组件
   */
  sliderOnchange(value: number, mode: SliderChangeMode) {
    this.currentTime = Number.parseInt(value.toString());
    this.controller.setCurrentTime(Number.parseInt(value.toString()), SeekMode.Accurate);
    // if(mode === SliderChangeMode.Begin || mode === SliderChangeMode.Moving) {
    //   this.isOpacity = false;
    // }
    // if(mode === SliderChangeMode.End) {
    //   this.isOpacity = true;
    // }
  }
}