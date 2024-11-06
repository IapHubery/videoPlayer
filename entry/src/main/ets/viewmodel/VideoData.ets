import { SwiperVideoItem } from './SwiperVideoItem'
import { VerticalVideoItem } from './VerticalVideoItem';
import { VerticalMusicItem } from './VerticaMusicItem';

export const SWIPER_VIDEOS: SwiperVideoItem[] = [
  new SwiperVideoItem($r('app.media.banner1')),
  new SwiperVideoItem($r('app.media.banner2')),
  new SwiperVideoItem($r('app.media.banner3'))
];

export const VERTICAL_VIDEOS: VerticalVideoItem[] = [
  new VerticalVideoItem(1, '4k航拍广州珠江两岸夜景延时','https://video.699pic.com/videos/42/24/30/a_66d7db5ebfd001725422430788.mp4'),
  new VerticalVideoItem(2, '4K秋天风中摇摆的芦苇草' ,'https://video.699pic.com/videos/26/93/66/a_66d58576d547b17252693668753_10s.mp4'), // $rawfile
  new VerticalVideoItem(3,'黑神话悟空游戏PV5-雄奇壮丽,光怪陆离,重走西游故地,再现神话结局','https://www.heishenhua.com/video/b1/PV05Full_ZH.mp4'),
  new VerticalVideoItem(4, '黑神话悟空游戏PV7', 'https://www.heishenhua.com/video/b1/gamesci_2024_PV07_ZH.mp4'),
  // new VerticalVideoItem(1, `居然穿Cos服到马尔代夫？！`, 'blob:https://www.bilibili.com/38efa656-7f4b-42c8-ae5e-2488ee8f81ee'),
  // new VerticalVideoItem(1, `太好了，是美少女战士！我们有救了❤`, 'https://www.bilibili.com/video/BV1AVSCYZEEg/'),
  // new VerticalVideoItem(1, `“多年以后再看，才明白这是多么讽刺！”`, 'https://www.bilibili.com/video/BV18nSdY6E86/'),
];

export const VERTICAL_MUSICS: VerticalMusicItem[] = [
  new VerticalMusicItem(1,'画','http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.mp3','赵磊','http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.jpg',),
  new VerticalMusicItem(2, '一生所爱','http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.m4a','卢冠廷 / 莫文蔚', 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.jpg'),
  new VerticalMusicItem(3,'倩女幽魂', 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.m4a','张国荣','http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.jpg'),
  new VerticalMusicItem(4, '海阔天空', 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.m4a','Beyond','http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.jpg'),
  new VerticalMusicItem(5, '月半小夜曲', 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.mp3','李克勤','http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.jpg'),
];