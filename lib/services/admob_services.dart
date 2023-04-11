import 'dart:io';

class AdmobService {
  static get appId {
    if (Platform.isIOS) {
      return '';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-1394140048146808~7315809048';
    }

    return null;
  }

  static get bannerAdUnitId {
    if (Platform.isIOS) {
      return '';
    } else if (Platform.isAndroid) {
      return /* testAd: 'ca-app-pub-3940256099942544/6300978111'*/ 'ca-app-pub-1394140048146808/5501639271';
    }
  }

  static get interstialAdUnitlId {
    if (Platform.isIOS) {
      return '';
    } else if (Platform.isAndroid) {
      return /*'ca-app-pub-3940256099942544/1033173712' */'ca-app-pub-1394140048146808/6039220547';
    }
  }
}
