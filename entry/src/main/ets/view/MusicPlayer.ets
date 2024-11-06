import prompt from '@ohos.promptAction';
import { changeSliderTime } from '../model/VideoController';
import { MusicSlider } from './MusicPlaySlider';
import router from '@ohos.router'

/**
 *  视频控制组件
 */
@Component
export struct MusicPlayer{
  private artName:string = ''
  private artAuthor:string = '';
  private source: string | Resource = '';
  private controller: VideoController = new VideoController();
  private previewUris?: string | Resource ;
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

  //收藏爱心变色
  @State likeFlag:boolean = false
  @State angleA:number = 0
  @State angleB:number = -35
  // 唱片旋转
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
    // 40px + 45% + 30% + 120px = 75% + 160px
    Column(){
      // 1.顶部 h:40px, top 8 , bottom 8, height : 40
      Row() {
        // 返回
        Row(){
          Text('\ue63b')// 返回
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
      // .border({width:2, color:Color.Red})

      // 2.图片 h:45%
      Stack({ alignContent: Alignment.Top }) {
        // 唱针
        Row(){
          Image($r('app.media.ic_stylus'))
            .width(200)
            .height(200)
            .aspectRatio(1)
            .rotate({
              x: 0,
              y: 0,
              z: 1,
              angle: this.angleB,
              centerX: 40,
              centerY: 30
            })
        }
        // .border({width:2, color:Color.Green})
        // .justifyContent(FlexAlign.Start)
        .margin({bottom:'30%'})
        .zIndex(2)
        //  唱片图
        Row() {
          Column() {
            Image(this.previewUris)
              // .width('70%')
              .width(200)
              .height(200)
              .borderRadius(400)
              .rotate({//自动旋转效果 没出现
                x: 0,
                y: 1,
                z: 1,
                angle: this.angleA,
                centerX:100,
                centerY:100,
              })
          }
          // cd图
          .backgroundImage($r('app.media.ic_cd'))
          .backgroundImageSize(ImageSize.Cover)
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .borderRadius(400)
          .clip(true)
          .aspectRatio(1)
        }
        .width('90%')
        .aspectRatio(1)
        .justifyContent(FlexAlign.Center)
        .zIndex(1)
      }
      .height('45%')
      .width('100%')
      .padding(20)
      .zIndex(0)
      // .border({width:2, color:Color.Blue})
      // 占用空白,避免控制器上漂
      // Blank()

      Stack(){
        // 3.歌曲信息
        Column() {
          //  歌名
          Text(this.artName)
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4bb0c4')
            .maxLines(1)
            .textOverflow({overflow:TextOverflow.Clip})
          //  作者
          Text(this.artAuthor)
            .fontSize(16)
            .fontColor('#4bb0c4')
            .maxLines(1)
            .textOverflow({overflow:TextOverflow.Clip})
        }
      }
      .height('30%')
      .width('100%')
      // .border({width:2, color:Color.Red})
      .zIndex(0)

      // //占用空白,避免控制器上漂
      // Blank()

      // 3.收藏下载评论
      // 操作
      Row() {
        //  收藏
        Badge({ value: '99+', style: { badgeSize: 12, badgeColor: '#45CCCCCC' } }) {
          Text(this.likeFlag?'\ue81b':'\ue648') // ❤收藏
            .fontFamily('myIconFont') // fontFamily不能去掉,去掉无法显示图标
            .fontColor(this.likeFlag?Color.Red:Color.White)
            .fontSize(24)
            .onClick(()=>{
              // 加特效
              this.likeFlag=this.likeFlag?false:true
            })
        }
        //  评论
        Badge({ value: '10W', position:BadgePosition.RightTop, style: { badgeSize: 12, badgeColor: '#45cccccc' } }) {
          Text('\ue64b')
            .fontFamily('myIconFont') // fontFamily不能去掉,去掉无法显示图标
            .fontColor(Color.White)
            .fontSize(24)
        }

        //  下载
        Badge({ value: 'vip', style: { badgeSize: 12, badgeColor: '#b7efd371' } }) {
          Text('\ue65c')
            .fontFamily('myIconFont') // fontFamily不能去掉,去掉无法显示图标
            .fontColor(Color.White)
            .fontSize(24)
        }

        //  分享
        Text('\ue625')
          .fontFamily('myIconFont') // fontFamily不能去掉,去掉无法显示图标
          .fontColor(Color.White)
          .fontSize(24)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)

      // 4.进度条,播放控制 h:15%
      Column() {
        MusicSlider({ controller: this.controller})

        Video({
          src: this.source,
          controller: this.controller
        })
          .width('100%')
          .height(0)
          .controls(false)
          .autoPlay(false)
          .loop(false)
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
      }
      .width('100%')
      .height(120)
      // .border({width:2, color:Color.Blue})
    }
    .width('100%')
    .height('100%')
    .backgroundImage(this.previewUris)
    .backgroundImageSize(ImageSize.Cover)
    .backgroundBlurStyle(BlurStyle.BACKGROUND_ULTRA_THICK)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
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