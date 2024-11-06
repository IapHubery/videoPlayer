
/**
 *垂直图片类。
 */
@Observed
export class VerticalVideoItem{
  id: number
  name: string
  video: string
  author?: string = '未知'
  image?: Resource | string = $r('app.media.preview')

  constructor(id: number, name: string, video: string,author?: string, image?: Resource | string) {
    this.id = id
    this.name = name
    this.video = video
    this.image = image
    this.author = author
  }
}