import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:r_get_ip/r_get_ip.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/selected_county.dart';
import '../../providers/selected_region.dart';
import '../components/app_bar/default_app_bar.dart';

import '../../constants/constants.dart';
import '../../providers/location_provider.dart';
import '../../providers/publish_provider.dart';
import '../../res/styles.dart';
import '../account/account_home.dart';
import '../components/button_create.dart';
import '../help_and_about/condition_general.dart';

class PublishScreen2 extends StatefulWidget {
  @override
  _PublishScreen2State createState() => _PublishScreen2State();
}

class _PublishScreen2State extends State<PublishScreen2> {
  Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Options'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            width: MediaQuery.of(context).size.width,
            color: Styles.principalColor,
            child: const Text(
              'Donnez encore plus de détails de visibilité à votre annonce, boostez la avec plus d\'option',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 15.0, fontFamily: 'ytv'),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                  child: Text(
                    "Options",
                  ),
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
                              Text("Mon annonce remonte "),
                              Text('en tête '),
                              Text(
                                  ' tous les jours pendant : 7 Jour(s) : 0.00 €')
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
                              Text('OPTION '),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                    const Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            activeColor: const Color(0xff2c3348),
                            value: Provider.of<PublishProvider>(context)
                                .checkBoxOption,
                            onChanged: (bool? value) {
                              Provider.of<PublishProvider>(context,
                                      listen: false)
                                  .changeCheckBoxOption(value!);
                            }),
                        const Text("Je dépose mon annonce sans Options")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            activeColor: const Color(0xff2c3348),
                            value: Provider.of<PublishProvider>(context)
                                .checkBoxCondition,
                            onChanged: (bool? value) {
                              Provider.of<PublishProvider>(context,
                                      listen: false)
                                  .changeCheckBoxCondition(value!);
                            }),
                        const Text(
                          "j’accepte",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        InkWell(
                          child: const Text(
                            " les conditions générales ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.green,
                              decorationThickness: 2,
                              //decorationStyle:
                              //TextDecorationStyle.dashed,
                            ),
                            /*style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.green, fontSize: 14,fontWeight: FontWeight.bold),*/
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConditionGenerale(),
                              ),
                            );
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "d’utilisation ",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    /*RadioListTile(
                      groupValue: withOutOptions,
                      title: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Text('Déposer mon annonce sans Options',
                              style:
                                  TextStyle(fontSize: 15.0, fontFamily: 'ytv')),
                        ],
                      ),
                      value: withOutOptions,
                      onChanged: (val) {
                        setState(() {
                          withOutOptions = !withOutOptions;
                          print(withOutOptions);
                        });
                      },
                    ),*/
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonCreate(
                            title: 'Precedent',
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            minWidth: 150,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Styles.principalColor,
                          ),
                          ButtonCreate(
                            title: 'Valider',
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            minWidth: 150,
                            onPressed: () async {
                              await EasyLoading.show(
                                status: 'En cours ...',
                              );

                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              AdsInformation.info['ip'] =''
                                  /*await RGetIp.externalIP*/;

                              AdsInformation.info['name'] =
                                  prefs.getString('name');

                              AdsInformation.info['type'] =
                                  prefs.getString('type');
                              AdsInformation.info['id_acc'] =
                                  prefs.getString('id_acc');
                              AdsInformation.info['comp_name'] =
                                  prefs.getString('comp_name');
                              AdsInformation.info['comp_num'] =
                                  prefs.getString('comp_num');

                              AdsInformation.info['state'] = '2';

                              AdsInformation.info['email'] =
                                  prefs.getString('email');

                              AdsInformation.info['password'] = '12345678';
                              /* Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .password;*/
                              AdsInformation.info['title'] =
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .title;
                              AdsInformation.info['price'] =
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .price;
                              AdsInformation.info['text'] =
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .text;
                              AdsInformation.info['value'] =
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .webSite;
                              AdsInformation.info['video'] =
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .videoWebSite;

                              AdsInformation.info['lat'] =
                                  Provider.of<LocationProvider>(context,
                                          listen: false)
                                      .lat
                                      .toString();
                              AdsInformation.info['lng'] =
                                  Provider.of<LocationProvider>(context,
                                          listen: false)
                                      .lng
                                      .toString();
                              AdsInformation.info['id_reg'] = context
                                  .read<SelectedRegion>()
                                  .region
                                  .idReg
                                  .toString();
                              AdsInformation.info['id_county'] = context
                                  .read<SelectedCounty>()
                                  .county
                                  .idCounty
                                  .toString();

                              AdsInformation.info['city'] =
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .city;
                              AdsInformation.info['postcode'] =
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .postalCode;
                              AdsInformation.info['adress'] =
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .address;

                              AdsInformation.info['phone'] =
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .phoneNumber;

                              AdsInformation.info['video'] == ''
                                  ? AdsInformation.info['video_num'] = '0'
                                  : AdsInformation.info['video_num'] = '1';

                              Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .checkBoxPhoneHidden ==
                                      true
                                  ? AdsInformation.info['phone_hidden'] = '1'
                                  : AdsInformation.info['phone_hidden'] = '0';
                              AdsInformation.info['pictures_pack'] = '0';
                              AdsInformation.info['last_visit'] = DateTime.now()
                                  .toString()
                                  .split(".")
                                  .first
                                  .toString();
                              AdsInformation.info['date'] =
                                  (DateTime.now().millisecondsSinceEpoch ~/
                                          1000)
                                      .toString();

                              switchOption(
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .radioItem1,
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .radioItem2,
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .radioItem3,
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .radioItem4,
                                  myTimeStamp);
                              Provider.of<PublishProvider>(context,
                                      listen: false)
                                  .updatePictureNumber();
                              int j = Provider.of<PublishProvider>(context,
                                      listen: false)
                                  .pictureNumber;
                              AdsInformation.info['picture_num'] = j.toString();
                              AdsInformation.info['pictures_num'] =
                                  j.toString();

                              var reponse = await http.post(
                                  Uri.parse(
                                      "https://api.trocbuy.fr/flutter/publish_ad.php"),
                                  body: AdsInformation.info);

                              AdsInformation.id_ad = jsonDecode(reponse.body);

                              try {
                                for (int i = 0; i < j; i++) {
                                  AdsInformationPhoto.picture['name'] =
                                      Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .imageName[i];
                                  AdsInformationPhoto.picture['image'] =
                                      Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .imageBase64[i];
                                  AdsInformationPhoto.picture['id_ad'] =
                                      AdsInformation.id_ad["id_ads"];

                                  await http.post(
                                      Uri.parse(
                                          "https://api.trocbuy.fr/flutter/photo_upload.php"),
                                      body: AdsInformationPhoto.picture);

                                  // print(AdsInformationPhoto.picture);
                                }

                                Fluttertoast.showToast(msg: "Annonce publiée");
                                EasyLoading.dismiss();
                                EasyLoading.showSuccess(
                                    'Votre Annonce a bien été publiée',
                                    duration: const Duration(seconds: 2));
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .clearPublishProvider();
                                Navigator.pushReplacementNamed(
                                    context, AccountHome.id);
                              } catch (e) {
                                //print("Error>>> $e");
                                EasyLoading.dismiss();
                                EasyLoading.showError(
                                    'Verifier votre connexion internet et réessayer',
                                    duration: const Duration(seconds: 2));
                              }
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
          ),
        ],
      ),
    );
  }
}

void switchOption(
    String opt1, String opt2, String opt3, String opt4, Timestamp myTimeStamp) {
  switch (opt1) {
    case 'Item 1':
      AdsInformation.info['top'] = '0';
      AdsInformation.info['top_days'] = '0';
      AdsInformation.info['top_time'] = '0';
      break;
    case 'Item 2':
      AdsInformation.info['top'] = '1';
      AdsInformation.info['top_days'] = '7';
      //TODO time in seconde
      AdsInformation.info['top_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 3':
      AdsInformation.info['top'] = '1';
      AdsInformation.info['top_days'] = '15';
      AdsInformation.info['top_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 4':
      AdsInformation.info['top'] = '1';
      AdsInformation.info['top_days'] = '30';
      AdsInformation.info['top_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 5':
      AdsInformation.info['top'] = '1';
      AdsInformation.info['top_days'] = '60';
      AdsInformation.info['top_time'] = myTimeStamp.seconds.toString();
      break;
  }
  switch (opt2) {
    case 'Item 6':
      AdsInformation.info['premium'] = '0';
      AdsInformation.info['premium_days'] = '0';
      AdsInformation.info['premium_time'] = '0';
      break;
    case 'Item 7':
      AdsInformation.info['premium'] = '1';
      AdsInformation.info['premium_days'] = '7';
      AdsInformation.info['premium_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 8':
      AdsInformation.info['premium'] = '1';
      AdsInformation.info['premium_days'] = '15';
      AdsInformation.info['premium_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 9':
      AdsInformation.info['premium'] = '1';
      AdsInformation.info['premium_days'] = '30';
      AdsInformation.info['premium_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 10':
      AdsInformation.info['premium'] = '1';
      AdsInformation.info['premium_days'] = '60';
      AdsInformation.info['premium_time'] = myTimeStamp.seconds.toString();
      break;
  }
  switch (opt3) {
    case 'Item 11':
      AdsInformation.info['urgent'] = '0';
      AdsInformation.info['urgent_days'] = '0';
      AdsInformation.info['urgent_time'] = '0';
      break;
    case 'Item 12':
      AdsInformation.info['urgent'] = '1';
      AdsInformation.info['urgent_days'] = '7';
      AdsInformation.info['urgent_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 13':
      AdsInformation.info['urgent'] = '1';
      AdsInformation.info['urgent_days'] = '15';
      AdsInformation.info['urgent_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 14':
      AdsInformation.info['urgent'] = '1';
      AdsInformation.info['urgent_days'] = '30';
      AdsInformation.info['urgent_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 15':
      AdsInformation.info['urgent'] = '1';
      AdsInformation.info['urgent_days'] = '60';
      AdsInformation.info['urgent_time'] = myTimeStamp.seconds.toString();
      break;
  }
  switch (opt4) {
    case 'Item 16':
      AdsInformation.info['framed'] = '0';
      AdsInformation.info['framed_days'] = '0';
      AdsInformation.info['framed_time'] = '0';
      break;
    case 'Item 17':
      AdsInformation.info['framed'] = '1';
      AdsInformation.info['framed_days'] = '7';
      AdsInformation.info['framed_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 18':
      AdsInformation.info['framed'] = '1';
      AdsInformation.info['framed_days'] = '15';
      AdsInformation.info['framed_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 19':
      AdsInformation.info['framed'] = '1';
      AdsInformation.info['framed_days'] = '30';
      AdsInformation.info['framed_time'] = myTimeStamp.seconds.toString();
      break;
    case 'Item 20':
      AdsInformation.info['framed'] = '1';
      AdsInformation.info['framed_days'] = '60';
      AdsInformation.info['framed_time'] = myTimeStamp.seconds.toString();
      break;
  }
}
