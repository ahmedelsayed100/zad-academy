import 'package:google_mobile_ads/google_mobile_ads.dart';

const int maxFailedLoadAttempts = 3;

class InterstitialAdMobView {
  final String adId = "ca-app-pub-4983333190473466/3317915362";
  InterstitialAd? _interstitialAd;

  int _numInterstitialLoadAttempts = 0;

  static intialization() {
    // ignore: unnecessary_null_comparison
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  void createAd() {
    InterstitialAd.load(
      adUnitId: adId,
      request: const AdRequest(),
      adLoadCallback:
          InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
        _interstitialAd = ad;
        _numInterstitialLoadAttempts = 0;
      }, onAdFailedToLoad: (LoadAdError err) {
        _numInterstitialLoadAttempts += 1;
        _interstitialAd = null;
        if (_numInterstitialLoadAttempts <= 2) {
          createAd();
        }
      }),
    );
  }

  void showAd() {
    if (_interstitialAd == null) {
      return;
    }
    _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        // print("ad");
      },
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, err) {
        ad.dispose();
        createAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }
}
