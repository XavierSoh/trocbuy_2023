import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../global_functions/default_validator.dart';
import '../myAds/update_images.dart';

import '../../../global_functions/ads_functions.dart';
import '../Widget/menu.dart';
import '../myAds/boost_ads.dart';
import 'show_image_network.dart';
import 'textformfield_normal.dart';

class MyAdsCard extends StatelessWidget {
  String imagePath;
  String titreAnnonce;
  String prixAnnonce;
  String? urgent;
  var jourExpirer;
  String nomberVues;
  var adsInfo;
  MyAdsCard(
      {required this.imagePath,
      required this.titreAnnonce,
      required this.prixAnnonce,
      this.jourExpirer,
      required this.nomberVues,
      this.adsInfo,
      this.urgent});

  final formKey = GlobalKey<FormState>();

  String? validate(String value) {
    if (value.isEmpty) return '*';
    return null;
  }

  @override
  build(BuildContext context) {
    final url = AdsFunctions.generateImageUrlFromAd(
      imagePath,
    );
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.black),
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(0.8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, top: 5, bottom: 5),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      // height: 200,
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Image.network(
                          'https://api.trocbuy.fr/flutter/trocbuy28/images/download.png',
                        ),
                        imageUrl: url,
                        // width: 67.5,
                        //height: 67.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Text(
                            titreAnnonce,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          width: MediaQuery.of(context).size.width * 0.45,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                            '$prixAnnonce €',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                            'Expirer le: $jourExpirer ',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, BoostAds.id);
                            },
                            splashColor: Colors.amberAccent,
                            child: const Text(
                              'Booster mon annonce',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blueAccent),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      PopupMenuButton<MenuItemHome>(
                        child: const Icon(Icons.more_vert_outlined),
                        itemBuilder: (BuildContext context) => Menu.items.map(
                          (e) {
                            return PopupMenuItem<MenuItemHome>(
                              value: e,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(e.title!),
                                    e.icon!,
                                  ],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onSelected: (value) {
                          onSelected(context, value, adsInfo);
                        },
                      ),
                      Text('Vues : $nomberVues')
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, MenuItemHome item, var adsInfo) {
    TextEditingController titleController =
        TextEditingController(text: adsInfo.title);
    TextEditingController textController =
        TextEditingController(text: adsInfo.text);

    TextEditingController priceController =
        TextEditingController(text: adsInfo.price + ' EUR');
    TextEditingController cityController =
        TextEditingController(text: adsInfo.city);
    switch (item) {
      case Menu.soldItem:
        break;
      case Menu.waitingItem:
        break;
      case Menu.editItem:
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return Form(
                key: formKey,
                child: Container(
                  padding: MediaQuery.of(context).viewInsets,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.grey.shade50),
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoButton(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 10),
                              child: const Text('Modifier'),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, UpdateImages.id);
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ShowImageNetwork(
                                url:
                                    'https://trocbuy.fr/upload/photos/${adsInfo.picture_name}',
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormFieldNormal(
                          controller: titleController,
                          validator: DefaultValidator.validator,
                        ),
                        const SizedBox(height: 15),
                        TextFormFieldNormal(
                          controller: textController,
                          maxLines: 5,
                          validator: DefaultValidator.validator,
                        ),
                        const SizedBox(height: 15),
                        TextFormFieldNormal(
                          controller: priceController,
                          validator: DefaultValidator.validator,
                        ),
                        const SizedBox(height: 15),
                        TextFormFieldNormal(
                          controller: cityController,
                          validator: DefaultValidator.validator,
                        ),
                        const SizedBox(height: 15)
                      ],
                    ),
                  ),
                ),
              );
            });
        break;
      case Menu.deleteItem:
        break;
      default:
        break;
    }
  }
}
