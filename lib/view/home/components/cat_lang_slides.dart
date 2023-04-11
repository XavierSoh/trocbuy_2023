import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'cat_lang_slide_item.dart';

import 'top_buttons.dart';

class CatLangSlides extends StatelessWidget {
  const CatLangSlides({Key? key}) : super(key: key);
  static const space = SizedBox(width: 10);
  @override
  build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const TopButtons(),
        const SizedBox(
          height: 5,
        ),
        CarouselSlider(
          options: CarouselOptions(
              enlargeCenterPage: false,
              initialPage: 0,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlay: true,
              height: MediaQuery.of(context).size.height * 12 / 100,
              aspectRatio: 16 / 9,
              viewportFraction: 1),
          items: const [
            CatLangRow(
              catLangSlideItems: [
                CatLangSlideItem(idCat: 81),
                CatLangSlideItem(idCat: 255),
                CatLangSlideItem(idCat: 72),
              ],
            ),
            CatLangRow(
              catLangSlideItems: [
                CatLangSlideItem(idCat: 270),
                CatLangSlideItem(
                    idCat: 258, url: 'https://topcovoiturage.com/accueil-topcovoiturage'),
                CatLangSlideItem(idCat: 82),
              ],
            ),
            CatLangRow(
              catLangSlideItems: [
                CatLangSlideItem(idCat: 90),
                CatLangSlideItem(idCat: 145),
                CatLangSlideItem(idCat: 209),
              ],
            ),
            CatLangRow(
              catLangSlideItems: [
                CatLangSlideItem(idCat: 85),
                CatLangSlideItem(idCat: 84),
                CatLangSlideItem(idCat: 252),
              ],
            ),
            CatLangRow(
              catLangSlideItems: [
                CatLangSlideItem(idCat: 254),
                CatLangSlideItem(idCat: 188),
                CatLangSlideItem(idCat: 179),
              ],
            ),
            CatLangRow(
              catLangSlideItems: [
                CatLangSlideItem(idCat: 245),
                CatLangSlideItem(idCat: 127),
                CatLangSlideItem(idCat: 106),
              ],
            ),
            CatLangRow(
              catLangSlideItems: [
                CatLangSlideItem(idCat: 267),
                CatLangSlideItem(idCat: 264),
                CatLangSlideItem(idCat: 100),
              ],
            ),
            CatLangRow(
              catLangSlideItems: [
                CatLangSlideItem(idCat: 101),
                CatLangSlideItem(idCat: 111),
                CatLangSlideItem(idCat: 265),
              ],
            ),
            CatLangRow(
              catLangSlideItems: [
                CatLangSlideItem(idCat: 71),
                CatLangSlideItem(idCat: 180),
                CatLangSlideItem(idCat: 219),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class CatLangRow extends StatelessWidget {
  const CatLangRow({Key? key, required this.catLangSlideItems})
      : super(key: key);
  final List<Widget> catLangSlideItems;
  @override
  build(BuildContext context) {
    return Row(
      children: catLangSlideItems,
    );
  }
}
