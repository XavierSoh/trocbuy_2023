import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
// import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:trocbuy/constants/constants.dart';
import 'package:trocbuy/res/styles.dart';
import 'package:trocbuy/view/components/app_bar/default_app_bar.dart';
import 'package:trocbuy/view/home/home.dart';
import 'package:trocbuy/view/login_page/provider/info_compte.dart';

import 'account/component/textformfield_normal.dart';
import 'components/button_create.dart';

class ChatSettings extends StatelessWidget {
  const ChatSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(
        title: "Profil",
      ),
      body: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _aboutMeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();

  // SharedPreferences? prefs;

  String id = '';
  String name = '';
  String first_name = '';
  String email = '';
  String phone = '';
  String photoUrl = '';
  String aboutMe = '';
  String pseudo = '';
  String address = '';
  String postcode = '';

  bool isLoading = false;
  File? avatarImageFile;

  @override
  void initState() {
    readLocal();

    super.initState();
  }

  String? validate(value) {
    if (value.toString().isEmpty) {
      return "*";
    }
    return null;
  }

  void readLocal() async {
    setState(() {
      id = Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['id_acc'] ??
          '';
      name = Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['name'] ??
          '';
      first_name = Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['first_name'] ??
          '';
      phone = Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['phone'] ??
          '';
      email = Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['email'] ??
          '';
      photoUrl = Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['photoUrl'] ??
          '';
      pseudo = Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['pseudo'] ??
          '';
      address = Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['address'] ??
          '';
      postcode = Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['postcode'] ??
          '';
      aboutMe = Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['aboutMe'] ??
          '';
    });
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? pickedFile;

    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    File image = File(pickedFile!.path);

    if (image != null) {
      setState(() {
        avatarImageFile = image;
        isLoading = true;
      });
    }
    //uploadFile();
  }

  Future<void> showAlertDialogDelete(
      BuildContext context,
      String titre,
      TextEditingController controller,
      TextInputType input,
      String prefsName) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Styles.principalColor,
          title: Text(
            'Modifier votre $titre',
            textAlign: TextAlign.start,
            style: const TextStyle(
                color: Colors.white, fontSize: 20.0, fontFamily: 'ytv'),
          ),
          content: TextFormFieldNormal(
            hintText: "Votre $titre",
            controller: controller,
            validator: validate,
            keyboardType: input,
          ),
          actions: [
            // ignore: deprecated_member_use
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text("Annuler", style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            // ignore: deprecated_member_use
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Confirmer",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () async {
                Provider.of<InfoCompteController>(context, listen: false)
                    .insertToInfoGlobal(prefsName, controller.text.toString());

                // await prefs!.setString(prefsName, controller.text.toString());
                // setState(() {
                //   readLocal();
                // });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Future uploadFile() async {
  //   String fileName = Provider.of<InfoCompteController>(context, listen: false)
  //       .InfoGlobal['id_acc'];
  //   UploadTask uploadTask = FirebaseStorage.instance
  //       .ref()
  //       .child(fileName)
  //       .putFile(avatarImageFile!);
  //   dynamic storageTaskSnapshot;
  //   await uploadTask.snapshotEvents.listen((snapshot) {
  //     if (snapshot.state == TaskState.success) {
  //       storageTaskSnapshot = snapshot;
  //       storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
  //         photoUrl = downloadUrl;
  //         Fluttertoast.showToast(msg: "Upload success");
  //       }, onError: (err) {
  //         setState(() {
  //           isLoading = false;
  //         });
  //         Fluttertoast.showToast(msg: err.toString());
  //       });
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }, onError: (err) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     Fluttertoast.showToast(msg: err.toString());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print(
        "Account >>>>>>>>>>>>>>>>>> ^*${Provider.of<InfoCompteController>(context).InfoGlobal}");

    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Avatar
              Container(
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      (avatarImageFile == null)
                          ? (photoUrl != ''
                              ? Material(
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => Container(
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 2.0,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Styles.principalColor),
                                      ),
                                      width: 120.0,
                                      height: 120.0,
                                      padding: const EdgeInsets.all(20.0),
                                    ),
                                    imageUrl: photoUrl,
                                    width: 120.0,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(45.0)),
                                  clipBehavior: Clip.hardEdge,
                                )
                              : const Icon(
                                  Icons.account_circle,
                                  size: 120.0,
                                  color: Styles.greyColor,
                                ))
                          : Material(
                              child: Image.file(
                                avatarImageFile!,
                                width: 120.0,
                                height: 120.0,
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(45.0)),
                              clipBehavior: Clip.hardEdge,
                            ),
                      /* IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        onPressed: getImage,
                        padding: EdgeInsets.only(left: 75.0,top: 15,bottom: 65),
                        splashColor: Colors.transparent,
                        highlightColor: greyColor,
                        iconSize: 30.0,
                      ),*/
                    ],
                  ),
                ),
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10.0),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: const Text(
                  'Modifer la photo',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: getImage,
              ),
              const SizedBox(
                height: 20,
              ),
              // Input
              Column(
                children: <Widget>[
                  Card(
                    elevation: 8,
                    //height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Nom :",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 6, bottom: 6),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    Provider.of<InfoCompteController>(context)
                                        .InfoGlobal['name'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff2c3348),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialogDelete(
                                    context,
                                    'Nom',
                                    _nameController,
                                    TextInputType.name,
                                    'name');
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 8,
                    //height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Prénom :",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 6, bottom: 6),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    Provider.of<InfoCompteController>(context)
                                        .InfoGlobal['first_name'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff2c3348),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialogDelete(
                                    context,
                                    'Prénom',
                                    _prenomController,
                                    TextInputType.name,
                                    'first_name');
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 8,
                    //height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Pseudo :",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 6, bottom: 6),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    Provider.of<InfoCompteController>(context)
                                        .InfoGlobal['pseudo'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff2c3348),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialogDelete(
                                    context,
                                    'pseudo',
                                    _pseudoController,
                                    TextInputType.name,
                                    'pseudo');
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 8,
                    //height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "E-mail :",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 6, bottom: 6),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    Provider.of<InfoCompteController>(context)
                                            .InfoGlobal['email'] ??
                                        '',
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16,
                                        color: Color(0xff2c3348),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialogDelete(
                                    context,
                                    'E-mail',
                                    _emailController,
                                    TextInputType.emailAddress,
                                    'email');
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 8,
                    //height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Phone :",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 6, bottom: 6),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    Provider.of<InfoCompteController>(context)
                                        .InfoGlobal['phone'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff2c3348),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialogDelete(
                                    context,
                                    'Numéro',
                                    _phoneController,
                                    TextInputType.phone,
                                    'phone');
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 8,
                    //height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "A propos de moi :",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 6, bottom: 6),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    Provider.of<InfoCompteController>(context)
                                            .InfoGlobal['aboutMe'] ??
                                        '',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff2c3348),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialogDelete(
                                    context,
                                    'A propos de moi',
                                    _aboutMeController,
                                    TextInputType.text,
                                    'aboutMe');
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 8,
                    //height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Adresse :",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 6, bottom: 6),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    Provider.of<InfoCompteController>(context)
                                        .InfoGlobal['address'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff2c3348),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialogDelete(
                                    context,
                                    'Adresse',
                                    _addressController,
                                    TextInputType.streetAddress,
                                    'address');
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 8,
                    //height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Code postal :",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 6, bottom: 6),
                                child: Text(
                                  Provider.of<InfoCompteController>(context)
                                      .InfoGlobal['postcode'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff2c3348),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showAlertDialogDelete(
                                    context,
                                    'Code postal',
                                    _postcodeController,
                                    TextInputType.number,
                                    'postcode');
                              }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonCreate(
                title: 'Enregistrer',
                padding: const EdgeInsets.symmetric(horizontal: 0),
                minWidth: 150,
                onPressed: () async {
                  await EasyLoading.show(status: 'Mise à jour...');
                  setState(() {
                    InforamtionUser.info['name'] = name;
                    InforamtionUser.info['first_name'] = first_name;
                    InforamtionUser.info['pseudo'] = pseudo;
                    InforamtionUser.info['email'] = email;
                    InforamtionUser.info['phone'] = phone;
                    InforamtionUser.info['address'] = address;
                    InforamtionUser.info['postcode'] = postcode;
                    InforamtionUser.info['about_me'] = aboutMe;
                  });

                  if (kDebugMode) {
                    print(Provider.of<InfoCompteController>(context,
                            listen: false)
                        .InfoGlobal);
                  }
                  var response = await http.post(
                    Uri.parse(
                        "https://api.trocbuy.fr/flutter/duo_update_profil.php"),
                    body: jsonEncode(
                      Provider.of<InfoCompteController>(context, listen: false)
                          .InfoGlobal,
                    ),
                  );

                  if (jsonDecode(response.body)['resultat'] == '1') {
                    await EasyLoading.showSuccess('Compte modifié',
                        duration: const Duration(seconds: 5));

                    await EasyLoading.dismiss();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  } else {
                    EasyLoading.showError('Verifiez les informations fournies',
                        duration: const Duration(seconds: 3));
                    await EasyLoading.dismiss();
                    Navigator.of(context).pop();
                  }
                  await EasyLoading.dismiss();
                },
                color: Colors.green,
              ),
            ],
          ),
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        ),

        // Loading
        Positioned(
          child: isLoading
              ? Container(
                  child: const Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Styles.principalColor)),
                  ),
                  color: Colors.white.withOpacity(0.8),
                )
              : Container(),
        ),
      ],
    );
  }
}
