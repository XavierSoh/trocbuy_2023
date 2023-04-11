import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../providers/vitrine_pro_provider.dart';

import '../../../constants/constants.dart';
import '../../../model/user_infos.dart';
import '../../../res/styles.dart';
import 'add_to_vitrine_pro.dart';
import 'ads_vitrine_pro.dart';

class VitrinePro extends StatefulWidget {
  const VitrinePro({Key? key}) : super(key: key);

  @override
  _VitrineProState createState() => _VitrineProState();
}

class _VitrineProState extends State<VitrinePro> {
  Future<void> adsNumber() async {
    // Change url to vitrine Pro
    String url = 'https://api.trocbuy.fr/flutter/duo_mesannonces.php';

    try {
      await http.post(Uri.parse(url), body: UserInfos.info).then(
        (value) async {
          if (value.body.toString() != '"aucune annonce"') {
            InformationAnnonces.info = await json.decode(value.body);
            Provider.of<VitrineProProvider>(context, listen: false)
                .changeResponse(value);
          }
          Provider.of<VitrineProProvider>(context, listen: false)
              .changeIsLoading(false);
        },
      );
    } catch (e) {
      Provider.of<VitrineProProvider>(context, listen: false)
          .changeIsLoading(false);
    }
  }

  @override
  void initState() {
    adsNumber();
    // Get id's ads VitrinePro from database and store it in VitrineProProvider();
    Provider.of<VitrineProProvider>(context, listen: false).clearProvider();

    // TODO: implement initState
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.principalColor,
        title: const Text('Vitrine Pro'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: const Text('data'),
          ),
          const AdsVitrinePro(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff2c3348),
        child: const Icon(Icons.add),
        tooltip: 'Ajouter des annonces',
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const AddToVitrinePro()));
        },
      ),
    );
  }
}
