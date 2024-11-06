import router from '@ohos.router';
import { VerticalVideoItem } from '../viewmodel/VerticalVideoItem';
import { VerticalMusicItem } from '../viewmodel/VerticaMusicItem';
import { VERTICAL_VIDEOS,VERTICAL_MUSICS } from '../viewmodel/VideoData';

/**
 *索引模块
 */
@Component
export struct VideoModule {
  build() {
    Column() {
      List({ space: 12}) {
        ForEach(VERTICAL_VIDEOS, (item: VerticalVideoItem) => {
          ListItem(){
            VerticalItemV({
              imageSrc: item.image,
              source: item.video, // '网络视频地址*******',
              artName: item.name,
              artAuthor: item.author
            })
              .width('100%')
              // 铺满显示
          }
        },(item: VerticalVideoItem) => JSON.stringify(item))
      }
      .lanes(2)
      .width('100%')
      .height('100%')
      .listDirection(Axis.Vertical)
    }
    .margin({
      left: '3.3%',
      right: '3.3%'
    })
    .width('93.3%')
    .justifyContent(FlexAlign.Start)
    .borderRadius(24)
    .borderStyle(BorderStyle.Solid)
    .borderColor(Color.White)
    .backgroundColor(Color.White)
  }
}


@Component
export struct MusicModule {
  build() {
    Column() {
      List({ space: 12}) {
        ForEach(VERTICAL_MUSICS, (item: VerticalMusicItem) => {
          ListItem(){
            VerticalItemM({
              imageSrc: item.image,
              source: item.music, // '网络视频地址*******',
              artName: item.name,
              artAuthor:item.author
            })
              .width('100%')
            // 铺满显示
          }
        },(item: VerticalMusicItem) => JSON.stringify(item))
      }
      .width('100%')
      .height('100%')
      .listDirection(Axis.Vertical)
    }
    .margin({
      left: '3.3%',
      right: '3.3%'
    })
    .width('93.3%')
    .justifyContent(FlexAlign.Center)
    .borderRadius(24)
    .borderStyle(BorderStyle.Solid)
    .borderColor(Color.White)
    .backgroundColor(Color.White)
  }
}

// 卡片
@Component
struct VerticalItemM {
  private imageSrc: Resource | string = $r('app.string.empty');
  private source: string = '';
  private artName: string = ''
  private artAuthor :string = '未知'

  build() {
    Flex({justifyContent: FlexAlign.SpaceBetween} ){
      Column(){
        Image(this.imageSrc)
         .height(50)
         .width(50)
          .clip(true)
           // .size({width:80, height:80})
         .borderRadius(5)
      }
      .clip(true)
      .height(50)
      .width(50)
      .margin({right:10})

      Column({space:5}) {
        // Text默认TextAlign.Start
        Text(this.artName)
          .width('100%')
          .fontSize(18)
          .maxLines(2) // 仿b站2行,超出部分...
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        // 作者名
        Text(this.artAuthor)
          .width('100%')
          .fontColor(Color.Gray)
          .fontSize(14)
          .maxLines(1) // 仿b站1行,超出部分...
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }.margin({top:5, bottom:5})
    }
    .onClick(() => {
      router.pushUrl({
        url: 'pages/musicPage',
        params: { artName:this.artName, artAuthor:this.artAuthor, source: this.source, previewUrl:this.imageSrc }
      });
    })
  }
}

@Component
struct VerticalItemV {
  private imageSrc: Resource | string = $r('app.media.preview')// $r('app.string.empty');
  private source: string = ''
  private artName: string = ''
  private artAuthor :string = '未知'

  build() {
    Column() {
      Image(this.imageSrc)
        .padding(5)
        .width('100%')
        .height(120)
        .borderRadius(5)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/videoPage',
            params: { source: this.source}
          });
        })

      Text(this.artName)
        .width('100%')
        .fontSize(18)
        .lineHeight(20)// 设置行高，例如20单位
        .maxLines(2) // 仿b站2行,超出部分...
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .height(40)
        .margin({ top: 5, bottom: 5, left:5 })

      Text(this.artAuthor)
        .fontColor(Color.Gray)
        .width('100%')
        .fontSize(14)
        .maxLines(1) // 仿b站1行,超出部分...
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: 5, bottom: 5, left:5 })
    }
    .justifyContent(FlexAlign.Center)
  }
}