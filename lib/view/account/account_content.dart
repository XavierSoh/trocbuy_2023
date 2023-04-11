import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user_infos.dart';
import '../../res/strings.dart';
import '../../utils/utils.dart';
import 'profile.dart';
import '../favorite/provider/provider_favorite.dart';

import 'component/expansionList.dart';
import 'myAds/my_ads.dart';

class AccountContent extends StatefulWidget {
  const AccountContent({Key? key}) : super(key: key);

  @override
  _AccountContentState createState() => _AccountContentState();
}

class _AccountContentState extends State<AccountContent> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  late int numberAds;
  String id = '';
  String name = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl = '${Utils.baseUrl}/trocbuy28/images/compte_utilisateur.png';
  String first_name = '';
  String pseudo = '';

  late SharedPreferences prefs;
  bool isLoading = false;

  // File avatarImageFile ;

  Future adsNumber() async {
    Provider.of<FavoriteFunctions>(context, listen: false).getListFavorite;
    String url = '${Utils.baseUrl}/duo_ads_number_compte.php';
    print('number ${UserInfos.info}');
    http.Response response =
        await http.post(Uri.parse(url), body: UserInfos.info);
    String number = await json.decode(response.body)['number'];
    setState(() {
      numberAds = int.parse(number);
    });
  }

  Future readLocal() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      pseudo = prefs.getString('pseudo') ?? '';
      id = prefs.getString('id') ?? '';
      name = prefs.getString('name') ?? '';
      first_name = prefs.getString('first_name') ?? '';
      nickname = name + ' ' + first_name;
      aboutMe = prefs.getString('aboutMe') ?? '';
      // photoUrl = prefs.getString('photoUrl') ?? '';
    });
  }

  @override
  void initState() {
    readLocal();
    adsNumber();
    super.initState();
  }

  @override
  build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding:
            const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
        child: Column(
          children: [
            //$ Text("ddd"),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Material(
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Container(
                              child: Image.asset(Utils.defaultPath),
                              width: 67.5,
                              height: 67.5,
                              padding: const EdgeInsets.all(2.0),
                            ),
                            imageUrl: photoUrl,
                            width: 67.5,
                            height: 67.5,
                            fit: BoxFit.cover,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(45.0)),
                          clipBehavior: Clip.hardEdge,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        aboutMe != ""
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  pseudo != ''
                                      ? Text(pseudo,
                                          style: const TextStyle(fontSize: 20))
                                      : const Text('Votre Pseudo',
                                          style: TextStyle(fontSize: 20)),
                                  Text(aboutMe,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.grey)),
                                ],
                              )
                            : Column(
                                children: [
                                  Text(pseudo,
                                      style: const TextStyle(fontSize: 20)),
                                  const Text('A propos de moi',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, height: 1),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyAds()));
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.note,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    numberAds != 0
                        ? Text("Mes Annonces ($numberAds)",
                            style: const TextStyle(fontSize: 18))
                        : const Text("Mes Annonces",
                            style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            InkWell(
              //borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.account_circle, size: 32),
                    const SizedBox(width: 20),
                    Text(
                      Strings.kProfile,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const ExpansionList(),
          ],
        ),
      ),
    );
  }
}
