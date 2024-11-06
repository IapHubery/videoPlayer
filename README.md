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



### 使用说明

1. 获取本地视频和网络视频。
2. 通过AVPlayer进行视频播放。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 10及以上版本SDK。
3. 本示例推荐使用DevEco Studio 5.0 Release及以上版本进行编译运行。