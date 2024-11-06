
/**
 *垂直图片类。
 */
@Observed
export class VerticalMusicItem{
  id: number
  name: string
  music: string
  author?:string = '未知'
  image?: Resource | string = $r('app.media.preview')

  constructor(id: number , name: string,  music: string, author?:string, image?: Resource | string ) {
    this.id = id
    this.name = name
    this.music = music
    this.author = author
    this.image = image
  }
}