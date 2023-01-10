import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../viewModels/ads_views_model/adhelper.dart';

class AdMobView extends StatefulWidget {
  const AdMobView({Key? key}) : super(key: key);
  @override
  State<AdMobView> createState() => _AdMobViewState();
}

class _AdMobViewState extends State<AdMobView> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;
  // ignore: unused_element
  Future<InitializationStatus> _initGoogleMobileAds() =>
      MobileAds.instance.initialize();

  @override
  // ignore: must_call_super
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: _bannerAd.size.width.toDouble(),
        height: _bannerAd.size.height.toDouble(),
        child: _isBannerAdReady == false
            ? AdWidget(ad: _bannerAd)
            : const SizedBox(),
      ),
    );
  }
}
