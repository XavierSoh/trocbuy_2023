import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/publish_provider.dart';
import '../../../res/styles.dart';

import '../../../model/ad_information.dart';
import '../../components/button_create.dart';

class BoostAds extends StatelessWidget {
  const BoostAds({Key? key}) : super(key: key);
  static const String id = 'boost_ads';
  @override
  build(BuildContext context) {
    Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.principalColor,
        title: const Text('Booster annonce'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const SizedBox(
            height: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: const [
                        Text(
                          'OPTION ',
                        ),
                        Text(
                          'ANNONCE EN TETE',
                        )
                      ],
                    ),
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem1,
                    title: Row(
                      children: const [
                        Text(
                          "Pas d'option ",
                        ),
                        Text(
                          "en tête",
                        ),
                      ],
                    ),
                    value: 'Item 1',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem1(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem1,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce remonte ",
                        ),
                        Text(
                          'en tête ',
                        ),
                        Text(
                          ' tous les jours pendant : 7 Jour(s) : 0.00 €',
                        )
                      ],
                    ),
                    value: 'Item 2',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem1(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem1,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce remonte ",
                        ),
                        Text(
                          'en tête ',
                        ),
                        Text(
                          ' tous les jours pendant : 15 Jour(s) : 2.00 €',
                        )
                      ],
                    ),
                    value: 'Item 3',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem1(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem1,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce remonte ",
                        ),
                        Text(
                          'en tête ',
                        ),
                        Text(
                          ' tous les jours pendant : 30 Jour(s) : 3.00 €',
                        )
                      ],
                    ),
                    value: 'Item 4',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem1(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem1,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce remonte ",
                        ),
                        Text(
                          'en tête ',
                        ),
                        Text(
                          ' tous les jours pendant : 60 Jour(s) : 5.00 €',
                        )
                      ],
                    ),
                    value: 'Item 5',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem1(value!);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: const [
                        Text(
                          'OPTION ',
                        ),
                        Text(
                          'ANNONCE PREMIUM',
                        )
                      ],
                    ),
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem2,
                    title: Row(
                      children: const [
                        Text(
                          "Pas d'option ",
                          //style: Styles.sousOption.copyWith(color: Colors.green,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "premium",
                        ),
                      ],
                    ),
                    value: 'Item 6',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem2(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem2,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce ",
                        ),
                        Text(
                          'premium ',
                        ),
                        Text(
                          ' pendant :  7 jour(s) : 2.00 €',
                        )
                      ],
                    ),
                    value: 'Item 7',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem2(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem2,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce ",
                        ),
                        Text(
                          'premium ',
                        ),
                        Text(
                          ' pendant :  15 jour(s) : 3.00 €',
                        )
                      ],
                    ),
                    value: 'Item 8',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem2(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem2,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce ",
                        ),
                        Text(
                          'premium ',
                        ),
                        Text(
                          ' pendant :  30 jour(s) : 5.00 €',
                        )
                      ],
                    ),
                    value: 'Item 9',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem2(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem2,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce ",
                        ),
                        Text(
                          'premium ',
                        ),
                        Text(
                          ' pendant :  60 jour(s) : 7.00 €',
                        )
                      ],
                    ),
                    value: 'Item 10',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem2(value!);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: const [
                          Text(
                            'OPTION ',
                          ),
                          Text(
                            'LOGO URGENT',
                          )
                        ],
                      )),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem3,
                    title: Row(
                      children: const [
                        Text(
                          "Pas d'option ",
                          //style: Styles.sousOption.copyWith(color: Colors.brown,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "logo urgent",
                        ),
                      ],
                    ),
                    value: 'Item 11',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem3(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem3,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Logo urgent ",
                        ),
                        Text(
                          'sur mon annonce ',
                        ),
                        Text(
                          ' pendant : 7 jour(s) : 0.00 €',
                        ),
                      ],
                    ),
                    value: 'Item 12',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem3(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem3,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Logo urgent ",
                        ),
                        Text(
                          'sur mon annonce ',
                        ),
                        Text(
                          ' pendant : 15 jour(s) : 2.00 €',
                        ),
                      ],
                    ),
                    value: 'Item 13',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem3(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem3,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Logo urgent ",
                        ),
                        Text(
                          'sur mon annonce ',
                        ),
                        Text(
                          ' pendant : 30 jour(s) : 3.00 €',
                        ),
                      ],
                    ),
                    value: 'Item 14',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem3(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem3,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Logo urgent ",
                        ),
                        Text(
                          'sur mon annonce ',
                        ),
                        Text(
                          ' pendant : 60 jour(s) : 5.00 €',
                        ),
                      ],
                    ),
                    value: 'Item 15',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem3(value!);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: const [
                        Text(
                          'OPTION ',
                        ),
                        Text(
                          'ANNONCE ENCADREE',
                        )
                      ],
                    ),
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem4,
                    title: Row(
                      children: const [
                        Text(
                          "Pas d'option ",
                        ),
                        Text(
                          " Encadrée",
                        ),
                      ],
                    ),
                    value: 'Item 16',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem4(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem4,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce ",
                        ),
                        Text(
                          ' Encadrée',
                        ),
                        Text(
                          ' pendant :  7 jour(s) : 0.00 €',
                        )
                      ],
                    ),
                    value: 'Item 17',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem4(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem4,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce ",
                        ),
                        Text(
                          ' Encadrée',
                        ),
                        Text(
                          ' pendant :  15 jour(s) : 2.00 €',
                        )
                      ],
                    ),
                    value: 'Item 18',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem4(value!);
                    },
                  ),
                  RadioListTile(
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem4,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce ",
                        ),
                        Text(
                          ' Encadrée',
                        ),
                        Text(
                          ' pendant :  30 jour(s) : 3.00 €',
                        )
                      ],
                    ),
                    value: 'Item 19',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem4(value!);
                    },
                  ),
                  RadioListTile(
                    selectedTileColor: Colors.red,
                    activeColor: const Color(0xff2c3348),
                    groupValue:
                        Provider.of<PublishProvider>(context).radioItem4,
                    title: Wrap(
                      direction: Axis.horizontal,
                      children: const [
                        Text(
                          "Mon annonce ",
                        ),
                        Text(
                          ' Encadrée',
                        ),
                        Text(
                          ' pendant :  60 jour(s) : 5.00 €',
                        )
                      ],
                    ),
                    value: 'Item 20',
                    onChanged: (String? value) {
                      Provider.of<PublishProvider>(context, listen: false)
                          .changeRadioItem4(value!);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonCreate(
                      title: 'Booster',
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      minWidth: 150,
                      onPressed: () async {
                        switchOption(
                            Provider.of<PublishProvider>(context, listen: false)
                                .radioItem1,
                            Provider.of<PublishProvider>(context, listen: false)
                                .radioItem2,
                            Provider.of<PublishProvider>(context, listen: false)
                                .radioItem3,
                            Provider.of<PublishProvider>(context, listen: false)
                                .radioItem4,
                            myTimeStamp);
                      },
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void switchOption(String opt1, String opt2, String opt3, String opt4,
      Timestamp myTimeStamp) {
    switch (opt1) {
      case 'Item 1':
        AdInformation.info['top'] = '0';
        AdInformation.info['top_days'] = '0';
        AdInformation.info['top_time'] = '0';
        break;
      case 'Item 2':
        AdInformation.info['top'] = '1';
        AdInformation.info['top_days'] = '7';
        //TODO time in seconde
        AdInformation.info['top_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 3':
        AdInformation.info['top'] = '1';
        AdInformation.info['top_days'] = '15';
        AdInformation.info['top_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 4':
        AdInformation.info['top'] = '1';
        AdInformation.info['top_days'] = '30';
        AdInformation.info['top_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 5':
        AdInformation.info['top'] = '1';
        AdInformation.info['top_days'] = '60';
        AdInformation.info['top_time'] = myTimeStamp.seconds.toString();
        break;
    }
    switch (opt2) {
      case 'Item 6':
        AdInformation.info['premium'] = '0';
        AdInformation.info['premium_days'] = '0';
        AdInformation.info['premium_time'] = '0';
        break;
      case 'Item 7':
        AdInformation.info['premium'] = '1';
        AdInformation.info['premium_days'] = '7';
        AdInformation.info['premium_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 8':
        AdInformation.info['premium'] = '1';
        AdInformation.info['premium_days'] = '15';
        AdInformation.info['premium_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 9':
        AdInformation.info['premium'] = '1';
        AdInformation.info['premium_days'] = '30';
        AdInformation.info['premium_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 10':
        AdInformation.info['premium'] = '1';
        AdInformation.info['premium_days'] = '60';
        AdInformation.info['premium_time'] = myTimeStamp.seconds.toString();
        break;
    }
    switch (opt3) {
      case 'Item 11':
        AdInformation.info['urgent'] = '0';
        AdInformation.info['urgent_days'] = '0';
        AdInformation.info['urgent_time'] = '0';
        break;
      case 'Item 12':
        AdInformation.info['urgent'] = '1';
        AdInformation.info['urgent_days'] = '7';
        AdInformation.info['urgent_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 13':
        AdInformation.info['urgent'] = '1';
        AdInformation.info['urgent_days'] = '15';
        AdInformation.info['urgent_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 14':
        AdInformation.info['urgent'] = '1';
        AdInformation.info['urgent_days'] = '30';
        AdInformation.info['urgent_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 15':
        AdInformation.info['urgent'] = '1';
        AdInformation.info['urgent_days'] = '60';
        AdInformation.info['urgent_time'] = myTimeStamp.seconds.toString();
        break;
    }
    switch (opt4) {
      case 'Item 16':
        AdInformation.info['framed'] = '0';
        AdInformation.info['framed_days'] = '0';
        AdInformation.info['framed_time'] = '0';
        break;
      case 'Item 17':
        AdInformation.info['framed'] = '1';
        AdInformation.info['framed_days'] = '7';
        AdInformation.info['framed_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 18':
        AdInformation.info['framed'] = '1';
        AdInformation.info['framed_days'] = '15';
        AdInformation.info['framed_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 19':
        AdInformation.info['framed'] = '1';
        AdInformation.info['framed_days'] = '30';
        AdInformation.info['framed_time'] = myTimeStamp.seconds.toString();
        break;
      case 'Item 20':
        AdInformation.info['framed'] = '1';
        AdInformation.info['framed_days'] = '60';
        AdInformation.info['framed_time'] = myTimeStamp.seconds.toString();
        break;
    }
  }
}
