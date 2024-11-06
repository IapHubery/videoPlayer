import font from '@ohos.font';
import router from '@ohos.router'
import { VideoPlayer } from '../view/VideoPlayer';
/**
 * 第二页面
 */
@Entry
@Component
struct videoPage{
  private previewUrl: string =  (router.getParams() as Record<string, Object>).previewUrl as string;
  private source: string = (router.getParams() as Record<string, Object>).source as string;
  @Provide isPlay: boolean = false
  @Provide playMode: 0 | 1 | 2 = 0
  @Provide isOpacity: boolean = false
  controller: VideoController = new VideoController();
  @Provide isLoading: boolean = false
  @Provide progressVal: number = 0
  @Provide flag: boolean = false
  @Provide controlFlag:boolean = true
  aboutToAppear() {
    this.source
    font.registerFont({
      familyName:'myIconFont',
      familySrc:'/fonts/iconfont.ttf'
    })
  }

  onPageHide() {
    this.controller.pause()
  }

  build() {
    Column() {
      Stack() {
        // 中间 显示 暂停三角
        if(!this.isPlay && !this.isLoading) {
          Text('\ue63d')
            .fontFamily('myIconFont') // fontFamily不能去掉,去掉无法显示图标
            .fontColor(Color.Gray)
            .fontSize(50)
            .zIndex(2)
        }
        // 加载中
        if(this.isLoading) {
          Progress({
            value: 0,
            total: 100,
            type: ProgressType.ScaleRing
          })
            .color(Color.Red)
            .value(this.progressVal)
            .width(80)
            .style({
              strokeWidth: 15,
              scaleCount: 15,
              scaleWidth: 5
            })
            .zIndex(1)
        }

        if (this.previewUrl!=''){
          VideoPlayer({
            source: this.source,
            previewUris:this.previewUrl,
            controller: this.controller
          })
            .zIndex(0)
        }
        else {
          VideoPlayer({
            source: this.source,
            controller: this.controller
          })
            .zIndex(0)
        }
      }
    }
    .height('100%')
    .backgroundColor(Color.Black)
  }
}