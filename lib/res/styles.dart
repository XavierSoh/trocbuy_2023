import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

class Styles {
  static const Color principalColor = Color(0xff2c3348);
  static const Color orangeColor = Colors.deepOrange;
  static const greyColor = Color(0xffaeaeae);
  static const greyColor2 = Color(0xffE8E8E8);

  ///

  static BoxDecoration borderStyle = BoxDecoration(
    borderRadius: const BorderRadius.all(
      Radius.circular(8.0),
    ),
    border: Border.all(color: Colors.grey, width: 1),
  );

  static const gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, mainAxisSpacing: 2.0, childAspectRatio: 0.58);

  static const rowDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1, mainAxisSpacing: 1.0, mainAxisExtent: 100);
  static CarouselOptions buildCarouselOptions(double height,
      {bool autoplay = true}) {
    return CarouselOptions(
        initialPage: 0,
        autoPlay: autoplay,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        enlargeCenterPage: false,
        height: height * 48 / 100,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 10),
        enlargeStrategy: CenterPageEnlargeStrategy.height);
  }

  static CarouselOptions carousselOptionsForImages(double height) {
    return CarouselOptions(
      enlargeCenterPage: false,
      initialPage: 0,
      enableInfiniteScroll: false,
      autoPlayInterval: const Duration(seconds: 10),
      autoPlay: true,
      height: height,
      aspectRatio: 16 / 9,
      viewportFraction: 1,
    );
  }

  static BoxDecoration border = BoxDecoration(
    border: Border.all(color: Styles.principalColor, width: 0.3),
  );

  static CarouselOptions carousselOptionsForFeatures() {
    return CarouselOptions(
      initialPage: 0,
      enableInfiniteScroll: true,
      pageSnapping: true,
      autoPlay: false,
      height: 400,
      viewportFraction: .9,
    );
  }

  static BoxDecoration adsBorderStyleDisplaying = BoxDecoration(
    borderRadius: const BorderRadius.all(
      Radius.circular(8.0),
    ),
    border: Border.all(color: Colors.grey, width: 1),
  );

  static RoundedRectangleBorder franceRoundRectangleBorder =
      RoundedRectangleBorder(
    side: const BorderSide(
        color: Colors.white, width: 1, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(50),
  );

  static RoundedRectangleBorder franceRoundRectangleBorder2 =
      RoundedRectangleBorder(
    side: const BorderSide(
        color: principalColor, width: 1, style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(50),
  );

  static const TextStyle kAllFranceButtonTextStyle =
      TextStyle(fontSize: 16.0, color: Colors.white);

  static const TextStyle kAllFranceButtonTextStyle2 =
      TextStyle(fontSize: 16.0, color: principalColor);
}
