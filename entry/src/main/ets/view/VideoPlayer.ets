
import prompt from '@ohos.promptAction';
import { changeSliderTime } from '../model/VideoController';
import { VideoSlider } from './VideoPlaySlider';
import { router } from '@kit.ArkUI';

/**
 *  视频控制组件
 */
@Component
export struct VideoPlayer{
  private source: string | Resource = '';
  private controller: VideoController = new VideoController();
  private previewUris?: string | Resource ;
  private  controlFlag:boolean = true;
  @Provide currentTime: number = 0;
  @Provide durationTime: number = 0;
  @Provide durationStringTime: string = '00:00';
  @Provide currentStringTime: string = '00:00';
  @Consume isPlay: boolean;
  @Consume playMode: 0 | 1 | 2;
  // @Consume isOpacity: boolean;
  @Consume flag: boolean;
  @Consume isLoading: boolean;
  @Consume progressVal: boolean;

  build() {
    Column() {
      // 顶部

      if (this.controlFlag) {
        Row() {
          Row(){
            // 返回
            Text('\ue63b')
              .fontFamily('myIconFont')
              .fontColor(Color.White)
              .fontSize(24)
              .onClick(() => {
                router.back()
              })
          }.margin({ left:24 })
          // 音效 三点属性
          Row(){
            Text('\ue86c')// 音效
              .fontFamily('myIconFont')
              .fontColor(Color.White)
              .fontSize(24)
              .margin({ right:10 })
            Text('\ue6b9')// 三点属性
              .fontFamily('myIconFont')
              .fontColor(Color.White)
              .fontSize(24)
          }
          .margin({ right:24 })
        }
        .margin({ top:8, bottom:8 })
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .height(40)
      }

      Video({
        src: this.source,
        previewUri: this.previewUris,
        controller: this.controller
      })
        .width('100%')
        .height('78%')
        .controls(false)
        .autoPlay(false)
        .objectFit(ImageFit.Contain)
        .loop(false)
        .borderWidth(2)
        .onUpdate((event) => {
          if(event) {
            this.currentTime = event.time
            this.currentStringTime = changeSliderTime(this.currentTime)
          }
        })
        .onPrepared((event) => {
          this.prepared(event?.duration)
        })
        .onFinish(() => {
          this.finish()
        })
        .onError(() => {
          prompt.showToast({
            duration: 5000,
            message: '请检查网络'
          });
        })
        .onClick(()=>{
          this.controlFlag=this.controlFlag?false:true
        })
      if (this.controlFlag){
        VideoSlider({ controller: this.controller})
      }
    }
  }

  /**
   *视频组件准备回调
   */
  prepared(duration: number) {
    this.durationTime = duration;
    let second: number = duration % 60;
    let min: number = Number.parseInt((duration / 60).toString());
    let head = min < 10 ? `${0}${min}`: min;
    let end = second < 10 ? `${0}${second}`: second;
    this.durationStringTime = `${head}:${end}`;
    this.flag = true;
  }

  /**
   * 视频组件完成回调
   */
  finish() {
    this.isPlay = false;
    this.playMode = 0;
    // this.isOpacity = false;
  }
}