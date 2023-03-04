# FaceSystem

## 赛题简介

​		会议签到功能作为会议场景中重要的一个环节，需要拥有便捷性、安全性、高效性等。系统应提供基本的会议管理功能，包括会议申请、参会人管理等，参会人信息可以预先通过人脸或照片进行录入，录入成功后，参会人即可进行人脸识别签到。

链接 [http://www.cnsoftbei.com/plus/view.php?aid=701](https://gitee.com/link?target=http%3A%2F%2Fwww.cnsoftbei.com%2Fplus%2Fview.php%3Faid%3D701)

## 演示视频

【基于深度学习的人脸识别签到系统演示视频】

 https://www.bilibili.com/video/BV1mM411J7yW

## 相关项目

- 前端模块  [meeting-face](https://github.com/saiGou-14H/meeting-face)
- 人脸模块  [retinaface-facenet](https://github.com/saiGou-14H/retinaface-facenet)

## 项目简介

​		传统的会议签到主要采用人工统计的方式进行,会议前会务组工作人员拿着参会人员名册,根据现场签到人的相关信息进行查找后签字确认,工作繁琐、容易出错且存在着汇总数据不及时的问题。硬件与软件技术的发展，计算机视觉识别逐渐成为软件行业的热门技术，其中人脸识别作为最普遍、热门的应用技术受到了众多机构的关注目前，国内外多家厂商和科研机构推出了比较成熟的商用系统或解决方案，其中 Orbeus、 Face++等已具备工业级别的人脸识别能力。但是这些商用的解决方案授权费用普遍较高，同时由于其只提供服务，源代码不开源，很难对其进行灵活的定制化改动。

​		针对本项目的需求制定了以下实现流程：首先采集数据集、同时对数据集进行清洗和标注；接着选取合适的模型，对模型进行网络搭配以及参数的调整；然后在SeeTaas平台上训练模型，训练结束后对模型进行验证评估，根据评估结果不断调整参数，经过多次训练和评估，得到合适的模型，并且将模型导出；接着将模型集成PyCharm上；最后，将预测数据导入部署好的模型，开启服务器并与后端数据库进行交互，同时检测出预测结果。

​		系统整体基于B/S模式进行架构和开发，用户只需进入浏览器输入网址，登录系统后即可进行刷脸签到，无需下载桌面端软件，这种方式部署便捷，操作简单。系统以及数据库部署在服务器上，只需一台连接互联网的计算机作为客户端便可对系统进行访问，大大提高用户的体验感，也方便日后系统管理员对系统的维护。

![系统流程图](https://github.com/saiGou-14H/save-image/blob/main/%E4%BA%BA%E8%84%B8%E8%AF%86%E5%88%AB%E4%BC%9A%E8%AE%AE%E7%AD%BE%E5%88%B0%E7%B3%BB%E7%BB%9F/%E4%BA%BA%E8%84%B8%E8%AF%86%E5%88%AB%E7%AD%BE%E5%88%B0%E6%80%BB%E6%B5%81%E7%A8%8B%E5%9B%BE.png)

## 项目实现

​		后端采用java语言和MySQL数据库搭建成项目结构，使用SpringBoot和Mybatics-Plus框架进行数据持久化，通过API框架-Swagger定义接口文档。此外，后端应用WebSocket协议与闸机系统进行全双工通信，实时接收前端发送的文字消息与图片流，使得客户端和服务器之间的数据交互变得更加简单，允许服务端主动向客户端主动推送数据，浏览器和服务器只需要完成一次握手，两者之间就直接可以创建持久性的连接，并进行双向数据传输。后端应用Http超文本传输协议与人脸识别模块进行数据交互，基于请求/响应的形式使得数据简单传输并及时反馈给服务器。两种通信方式相辅相成，使得用户并发刷脸签到的完成时间控制在2-3秒以内，大大提高了客户端与服务器端的请求响应速率。



## 后端技术栈

| 技术         | 说明            | 链接                                      |
| ------------ | --------------- | ----------------------------------------- |
| SpringBoot   | Web应用开发框架 | https://spring.io/projects/spring-boot    |
| MyBatis-Plus | ORM框架         | https://baomidou.com/                     |
| JWT          | JWT登录支持     | https://github.com/jwtk/jjwt              |
| Lombok       | Java语言增强库  | https://github.com/rzwitserloot/lombok    |
| Swagger-UI   | API文档生成工具 | https://github.com/swagger-api/swagger-ui |