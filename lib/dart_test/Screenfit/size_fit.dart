import 'dart:ui';

class HYSizeFit {
  // 1.基本信息
  static late double physicalWidth;
  static late double physicalHeight;
  static late double screenWidth;
  static late double screenHeight;
  static late double dpr;
  static late double statusHeight;

  static late double rpx;
  static late double px;

  static void initialize({double standardSize = 750}) {
    // 1.手机的物理分辨率，像素值
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2.获取dpr，屏幕分辨率
    dpr = window.devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;

    // 5.计算rpx的大小，微信小程序适配方案，以iphone6为设计标准，屏幕宽度分750份，然后乘以不同手机屏幕
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}