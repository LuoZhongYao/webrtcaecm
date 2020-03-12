[![Build Status](https://travis-ci.org/LuoZhongYao/webrtcaecm.svg?branch=master)](https://travis-ci.org/LuoZhongYao/webrtcaecm)


webrtcaecm
==========

webRTC aecm模块 ，单独编译，相关头文件都已经整理

### 说明

之前上传的版本是无法编译的, 现在上传能编译版本.
自上次整理以来,webrtc进行了大量修改, 从之前的C语言换成了C++实现, 要将audio_process模块提取出来
单独使用,难度比较大, 建议直接编译webrtc直接调用webrtc接口更为方便.
