import 'dart:io';

class AdHelper {
  //====================this is the mob app id================
  //======ca-app-pub-7618840372767433~2551414636==============
  //==========================================================
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4983333190473466/2892983964';
      // return 'ca-app-pub-7618840372767433/2032577871';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  // static String get interstitialAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-4983333190473466/3317915362';
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/4411468910";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }

  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-7618840372767433/2032577871";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/1712485313";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }
}
