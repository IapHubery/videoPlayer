# 视频播放器（ArkTS）

### 简介

基于HarmonyOS的播放管理类（AVPlayer），实现视频播放功能。

![image](screenshots/device/VideoPlayer.gif)

### 相关概念

- [AVPlayer](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-media-0000001427902672-V3?ha_linker=eyJ0cyI6MTY4NDM5NDkyNzY4NCwiaWQiOiJhMDEwYWRjNDg3N2ZhMWYwMzc0ZTYzNTdlMjk3ZDkzZCJ9#ZH-CN_TOPIC_0000001493415664__avplayer9)播放管理类：视频播放组件。

### 相关权限

本篇Codelab需要在module.json5中配置如下权限：

```typescript
"requestPermissions": [
  {
    "name": "ohos.permission.INTERNET"
  }
]
```

### 模拟器实图
![musicList](https://github.com/user-attachments/assets/841e8b8e-1cf8-4098-86e2-72c7acaeee87)
![videoPlaying](https://github.com/user-attachments/assets/485451df-bb53-44f8-9aec-eaf4f02164a2)
![videoList](https://github.com/user-attachments/assets/5003028c-6680-45d1-bbbd-69ccca356e76)
![playList](https://github.com/user-attachments/assets/9a0a8c95-4993-4146-a7b5-53c1636f03ab)
![musicPlayPage](https://github.com/user-attachments/assets/eb5180e8-5e94-46d9-8f30-ba0d549610a4)
![musicPlaying](https://github.com/user-attachments/assets/a6f0768a-a0d9-4fe4-aaf0-b087775b0262)


### 使用说明

1. 获取本地视频和网络视频。
2. 通过AVPlayer进行视频播放。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 10及以上版本SDK。
3. 本示例推荐使用DevEco Studio 5.0 Release及以上版本进行编译运行。
