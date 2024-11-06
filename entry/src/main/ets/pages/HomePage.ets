import { MusicModule, VideoModule } from '../view/IndexModule'
import font from '@ohos.font';
/**
 * 首页
 */
@Entry
@Component
struct HomePage {
  private controller: TabsController = new TabsController();
  @State bottomIndex: number = 0; // tabBar底栏位置
  @State topIndex: number = 0; // tabBar顶栏位置
  @Builder tabVideo() {   // 自定义标签-视频
    Column() {
      Text('\ue64a')
        .fontFamily('myIconFont') // fontFamily不能去掉,去掉无法显示图标
        .fontColor(this.bottomIndex == 0 ? "#ef4444":Color.Gray)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
      Text('视频')
        .fontSize(14)
        .fontColor(this.bottomIndex == 0 ? "#ef4444":Color.Gray)
    }
    .margin({top:5, bottom:5})
    .width('100%')
    .height(240)
    // .margin({bottom:5})
    .onClick(() => {
      this.bottomIndex = 0;
      this.controller.changeIndex(this.bottomIndex);
    })
  }

  @Builder tabMusic() {   // 自定义标签-音乐
    Column() {
      Text('\ue64f')
        .fontFamily('myIconFont')
        .fontColor(this.bottomIndex == 1 ? "#ef4444":Color.Gray)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
      Text('音乐')
        .fontSize(14)
        .fontColor(this.bottomIndex == 1 ? "#ef4444":Color.Gray)
    }
    .height(240)
    .width("100%")
    .margin({top:5, bottom:5})
    .onClick(() => {
      this.bottomIndex = 1;
      this.controller.changeIndex(this.bottomIndex);
    })
  }

  @Builder tabPlayList() {   // 自定义标签-播放列表
    Column() {
      Text('\ue601')
        .fontFamily('myIconFont')
        .fontColor(this.bottomIndex == 2 ? "#ef4444":Color.Gray)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
      Text('播放列表')
        .fontSize(14)
        .fontColor(this.bottomIndex == 2 ? "#ef4444":Color.Gray)
      // 靛蓝:  #2a58d0  BiliBili粉:#ef4444
    }
    .width("100%")
    .height(240)
    .margin({top:5, bottom:5})
    .onClick(() => {
      this.bottomIndex = 2;
      this.controller.changeIndex(this.bottomIndex);
    })
  }

  aboutToAppear(): void {
    font.registerFont({
      familyName:'myIconFont',
      familySrc:'/fonts/iconfont.ttf'
    })
  }

  build() {
    Column() {
      // 顶栏 { space: 24}
      Row(){
        Row(){  // BiliBili 电视图标
          Text('\ue61e')
            .fontFamily('myIconFont') // fontFamily不能去掉,去掉无法显示图标
            .fontSize(24)
        }.margin({ left:20 })
        // 非播放列表页面,显示顶栏信息
        if (this.bottomIndex<2){
          Row(){
            Text('\ue8ef')  // 查询
              .fontFamily('myIconFont') // fontFamily不能去掉,去掉无法显示图标
              .fontSize(24)
              .margin({ right:10 })
            Text('\ue6b9')  // 三点设置
              .fontFamily('myIconFont') // fontFamily不能去掉,去掉无法显示图标
              .fontSize(24)
          }.margin({ right:20 })
        }
      }
      .margin({bottom:10})
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height(32)

      // tabBar
      Row(){
        Tabs({barPosition:BarPosition.End, controller: this.controller }){
          TabContent(){
            VideoModule()
          }.tabBar(this.tabVideo())

          TabContent(){
            Tabs({barPosition:BarPosition.Start}){
              TabContent(){
                Column(){
                  MusicModule()
                }
              }.tabBar('歌曲')

              TabContent(){
                Text('文件夹内容')
              }.tabBar('文件夹')

              TabContent(){
                Text('专辑内容')
              }.tabBar('专辑')

              TabContent(){
                Text('歌手内容')
              }.tabBar('歌手')
            }

          }.tabBar(this.tabMusic())

          TabContent(){
            Text('我的内容')
          }.tabBar(this.tabPlayList())

        }.barMode(BarMode.Fixed)         // TabBar均分
        .onChange((bottomIndex: number) => {  // 页面切换回调
          this.bottomIndex = bottomIndex;
        })

      }
      // .border({ width:2, color:Color.Blue})
      .width('100%')
      // .height('90%')
    }
    // .border({ width:2, color:Color.Red})
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}