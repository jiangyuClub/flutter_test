import '../shared/size_fit.dart';

extension DoubleFit on double {
  //加上get就可以去掉()，调动的时候更方便
  double get px {
    return HYSizeFit.setPx(this);
  }

  double get rpx {
    return HYSizeFit.setRpx(this);
  }
}
