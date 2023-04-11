class Utils {
  static const appName = "Trocbuy";
  static const versionNumber = "1.0.5";
  static const logoPath = "images/logof.png";
  static const defaultPath = "images/download.png";
  static const homeMapImagePath = "images/france.png";
  static const baseUrl = "https://api.trocbuy.fr/flutter";
  static const baseUrlForShare = "https://trocbuy.fr/en/ad";
  static const launchIconPath = "images/ic_launcher-playstore.png";
  static const helpCenterUrl = "https://trocbuy.fr/fr/info/FAQ-11";
  static const basicPhotoUrl = "https://trocbuy.fr/upload/photos";
  static const contactUsUrl = "https://trocbuy.fr/fr/send_contact.php";
  static const cguUrl =
      "https://trocbuy.fr/fr/info/Conditions-generales-d-utilisation-3";

  static const kCguPath = "images/cgu.png";
  static const errorImageUrl =
      "https://api.trocbuy.fr/flutter/trocbuy28/images/download.png";

  static const String baseUrl2 = 'https://trocbuy.fr/en/ad/';
  static const String baseLink = '$baseUrlForShare/xav_ads_link.php/en/ad';
  static const String regionsUrl =
      "https://api.trocbuy.fr/flutter/get_table.php?table=TROC9_regions_lang&code_lang=fr";
  static const String countiesUrl =
      "https://api.trocbuy.fr/flutter/get_table.php?table=TROC9_counties_lang&code_lang=fr";
  static String getCodeLang() {
    return "fr";
  }

  static String getCurrency() {
    return " €";
  }
}
