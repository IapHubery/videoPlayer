import font from '@ohos.font';
import router from '@ohos.router'
import { MusicPlayer } from '../view/MusicPlayer';
/**
 * 第二页面
 */
@Entry
@Component
struct musicPage{
  private artName:string =  (router.getParams() as Record<string, Object>).artName as string;
  private artAuthor:string =  (router.getParams() as Record<string, Object>).artAuthor as string;
  private previewUrl: string =  (router.getParams() as Record<string, Object>).previewUrl as string;
  private source: string = (router.getParams() as Record<string, Object>).source as string;
  @Provide isPlay: boolean = false
  @Provide playMode: 0 | 1 | 2 = 0
  @Provide isOpacity: boolean = false
  controller: VideoController = new VideoController();
  @Provide isLoading: boolean = false
  @Provide progressVal: number = 0
  @Provide flag: boolean = false

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
      Stack() {
        // 中间 显示 暂停三角
        if(!this.isPlay && !this.isLoading) {
          Text('\ue63d')
            .fontFamily('myIconFont') // fontFamily不能去掉,去掉无法显示图标
            .fontColor(Color.Gray)
            .fontSize(50)
            .zIndex(2)
        }
        // 加载中 转圈
        if(this.isLoading) {
          Progress({
            value: 0,
            total: 100,
            type: ProgressType.ScaleRing
          })
            .color(Color.Red)
            .value(this.progressVal)
            .width(40)
            .style({
              strokeWidth: 15,
              scaleCount: 15,
              scaleWidth: 5
            })
            .zIndex(1)
          }
        // 播放器
        MusicPlayer({
          artName:this.artName,
          artAuthor:this.artAuthor,
          source: this.source,
          previewUris:this.previewUrl,
          controller: this.controller
        })
          .zIndex(0)
      }
    .height('100%')
  }
}