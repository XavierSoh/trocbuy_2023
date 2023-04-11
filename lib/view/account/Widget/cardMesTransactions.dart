import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../global_functions/ads_functions.dart';

class CardMesTransactions extends StatelessWidget {
  String? imagePath;
  String? titerAnnonce;
  String? prixAnnonce;
  int? nomberVues;

  CardMesTransactions({
    this.imagePath,
    this.titerAnnonce,
    this.prixAnnonce,
    this.nomberVues,
  });

  @override
  build(BuildContext context) {
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
                        placeholder: (context, url) => Container(
                          child: Image.asset(
                            'images/download.png',
                          ),
                          // width: 67.5,
                          //height: 67.5,
                          padding: const EdgeInsets.all(2.0),
                        ),
                        imageUrl:
                            AdsFunctions.generateImageUrlFromAd(imagePath!),
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
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                titerAnnonce!,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.015,
                              ),
                              Text(
                                '$prixAnnonce €',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.01,
                              ),
                            ],
                          ),
                        ),
                        Text('Vues : $nomberVues'),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.01,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 15, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.verified,
                          size: MediaQuery.of(context).size.width * 0.1,
                          color: Colors.lightGreen,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.01,
                    ),
                    const Text('Vendu')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
