// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trocbuy/view/account/account_home.dart';

import 'package:trocbuy/view/home/home.dart';
import 'package:trocbuy/view/login_page/provider/info_compte.dart';

import '../../model/is_login.dart';
import '../settings.dart';
import 'component/expansionList.dart';
import 'myAds/my_ads.dart';

class comptePage extends StatefulWidget {
  const comptePage({Key? key}) : super(key: key);

  @override
  _comptePageState createState() => _comptePageState();
}

class _comptePageState extends State<comptePage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String name = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl =
      'https://api.trocbuy.fr/flutter/trocbuy28/images/compte_utilisateur.png';

  String pseudo = '';

  bool isLoading = false;
  SharedPreferences? prefs;

  // File avatarImageFile ;

  // Future readLocal() async {
  //   setState(() {
  //     pseudo = Provider.of<InfoCompteController>(context, listen: false)
  //             .InfoGlobal['pseudo'] ??
  //         '';
  //     // id = prefs!.getString('id') ?? '';
  //     // name = Provider.of<InfoCompteController>(context, listen: false)
  //     //         .InfoGlobal['name'] ??
  //     //     '';
  //     // first_name = Provider.of<InfoCompteController>(context, listen: false)
  //     //         .InfoGlobal['first_name'] ??
  //     //     '';
  //     // nickname = name + ' ' + first_name;
  //     aboutMe = Provider.of<InfoCompteController>(context, listen: false)
  //             .InfoGlobal['aboutMe'] ??
  //         '';
  //     // photoUrl = prefs.getString('photoUrl') ?? '';
  //   });
  // }

  @override
  void initState() {
    // readLocal();
    // adsNumber();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding:
            const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatSettings()));
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
                              child: Image.asset(
                                'images/download.png',
                              ),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Provider.of<InfoCompteController>(context,
                                          listen: false)
                                      .InfoGlobal['pseudo'] ??
                                  'Votre Pseudo',
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                                Provider.of<InfoCompteController>(context,
                                            listen: false)
                                        .InfoGlobal['aboutMe'] ??
                                    'A propos de moi',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ],
                        ),
                        // aboutMe != ""
                        //     ? Column(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Provider.of<InfoCompteController>(context,
                        //                           listen: false)
                        //                       .InfoGlobal['pseudo'] !=
                        //                   null
                        //               ? Text(
                        //                   Provider.of<InfoCompteController>(
                        //                           context,
                        //                           listen: false)
                        //                       .InfoGlobal['pseudo'],
                        //                   style: const TextStyle(fontSize: 20))
                        //               : const Text('Votre Pseudo',
                        //                   style: TextStyle(fontSize: 20)),
                        //           Text(
                        //               Provider.of<InfoCompteController>(context,
                        //                       listen: false)
                        //                   .InfoGlobal['aboutMe'],
                        //               style: const TextStyle(
                        //                   fontSize: 16, color: Colors.grey)),
                        //         ],
                        //       )
                        //     : Column(
                        //         children: [
                        //           Text(pseudo,
                        //               style: const TextStyle(fontSize: 20)),
                        //           const Text('A propos de moi',
                        //               style: TextStyle(
                        //                 fontSize: 16,
                        //                 color: Colors.grey,
                        //               )),
                        //         ],
                        //       ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.logout,
                        size: 28,
                      ),
                      onPressed: () async {
                        prefs = await SharedPreferences.getInstance();
                        await EasyLoading.show(
                          status: 'Déconnexion...',
                        );
                        try {
                          IsLogin.state = false;
                          Provider.of<InfoCompteController>(context,
                                  listen: false)
                              .InfoGlobal
                              .clear();
                          prefs!.clear();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        } catch (e) {
                          print(e);
                          EasyLoading.showError(
                              'Erreur de déconnexion, veuillez réessayer',
                              duration: const Duration(seconds: 2));
                        }

                        EasyLoading.dismiss();
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
            const SizedBox(
              height: 10,
            ),
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
                    Text(
                        "Mes Annonces (${Provider.of<InfoCompteController>(context).InfoGlobal['number']})",
                        style: const TextStyle(fontSize: 18))
                  ],
                ),
              ),
            ),
            /*  InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MesTransactions()));
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.trending_up,
                      size: 32,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Transactions", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),*/
            InkWell(
              //borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatSettings()));
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.account_circle,
                      size: 32,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Profil", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            /*  InkWell(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => VitrinePro()));
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_balance,
                      size: 32,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Ma Vitrine Pro", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),*/
            Container(
              child: const ExpansionList(),
            ),

            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 16.0),
            //     child: OutlinedButton.icon(
            //       icon: const Icon(Icons.logout, color: Styles.principalColor),
            //       label: const Text(
            //         'Se déconnecter',
            //         style: TextStyle(color: Styles.principalColor),
            //       ),
            //       onPressed: () async {
            //         await EasyLoading.show(
            //           status: 'Déconnexion...',
            //         );
            //         try {
            //           IsLogin.state = false;
            //           Provider.of<InfoCompteController>(context, listen: false)
            //               .InfoGlobal
            //               .clear();
            //           Navigator.pushReplacement(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => Trocbuy(),
            //             ),
            //           );
            //         } catch (e) {
            //           EasyLoading.showError(
            //               'Erreur de déconnexion, veuillez réessayer',
            //               duration: const Duration(seconds: 2));
            //         }

            //         EasyLoading.dismiss();
            //       },
            //     ),
            //   ),
            // )

            // InkWell(
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context) =>
            //         ExpansionList ()));
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.only(
            //         top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.settings,
            //           size: 32,
            //         ),
            //         SizedBox(
            //           width: 20,
            //         ),
            //         Text("Paramètres", style: TextStyle(fontSize: 18)),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, bottom: 8.0, left: 80.0, right: 8.0),
            //   child: Row(
            //     children: [
            //       Text("Acheter des crédits"),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, bottom: 8.0, left: 80.0, right: 8.0),
            //   child: Row(
            //     children: [
            //       Text("Information personnelles"),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, bottom: 8.0, left: 80.0, right: 8.0),
            //   child: Row(
            //     children: [
            //       Text("E-mail"),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, bottom: 8.0, left: 80.0, right: 8.0),
            //   child: Row(
            //     children: [
            //       Text("Mot de passe"),
            //     ],
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, bottom: 8.0, left: 80.0, right: 8.0),
            //   child: Row(
            //     children: [
            //       Text("Notification"),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, bottom: 8.0, left: 80.0, right: 8.0),
            //   child: Row(
            //     children: [
            //       Text("Favoris"),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.help_outline,
            //         size: 32,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Text("Aides", style: TextStyle(fontSize: 18)),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, bottom: 8.0, left: 80.0, right: 8.0),
            //   child: Row(
            //     children: [
            //       Text("Information pratiques"),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, bottom: 8.0, left: 80.0, right: 8.0),
            //   child: Row(
            //     children: [
            //       Text("Aide"),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, bottom: 8.0, left: 80.0, right: 8.0),
            //   child: Row(
            //     children: [
            //       Text("Moyens de paiement"),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
