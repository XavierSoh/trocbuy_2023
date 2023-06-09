import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global_functions/default_validator.dart';
import '../../model/user_infos.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../components/app_bar/default_app_bar.dart';
import '../login_page/login_page.dart';

import '../components/button_create.dart';
import 'component/textformfield_normal.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: Strings.kProfile),
      body: const SettingsScreen(),
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
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _aboutMeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();

  late SharedPreferences prefs;

  String id = '';
  String name = '';
  String firstName = '';
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

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString('id') ?? '';
      name = prefs.getString('name') ?? '';
      firstName = prefs.getString('first_name') ?? '';
      phone = prefs.getString('phone') ?? '';
      email = prefs.getString('email') ?? '';
      photoUrl = prefs.getString('photoUrl') ?? '';
      pseudo = prefs.getString('pseudo') ?? '';
      address = prefs.getString('address') ?? '';
      postcode = prefs.getString('postcode') ?? '';
      aboutMe = prefs.getString('aboutMe') ?? '';
    });
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? pickedFile;

    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    File image = File(pickedFile!.path);

    setState(
      () {
        avatarImageFile = image;
        isLoading = true;
      },
    );
    uploadFile();
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
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          content: TextFormFieldNormal(
            hintText: "Votre $titre",
            controller: controller,
            validator: DefaultValidator.validator,
            keyboardType: input,
            onChanged: (String string) {},
            suffixIcon: const SizedBox.shrink(),
          ),
          actions: [
            // ignore: deprecated_member_use
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
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
                await prefs.setString(prefsName, controller.text.toString());
                setState(() {
                  readLocal();
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future uploadFile() async {
    String fileName = id;
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child(fileName)
        .putFile(avatarImageFile!);
    dynamic storageTaskSnapshot;
    uploadTask.snapshotEvents.listen((snapshot) {
      if (snapshot.state == TaskState.success) {
        storageTaskSnapshot = snapshot;
        storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
          photoUrl = downloadUrl;
          Fluttertoast.showToast(msg: "Upload success");
        }, onError: (err) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(msg: err.toString());
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }, onError: (err) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: err.toString());
    });
  }

  @override
  build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    ],
                  ),
                ),
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10.0),
              ),
              const SizedBox(height: 10),
              InkWell(
                child: const Text(
                  'Modifez votre photo',
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                onTap: getImage,
              ),
              const SizedBox(height: 20),
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
                                    name,
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
                                    firstName,
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
                                    'Prénom',
                                    _surnameController,
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
                                    pseudo,
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
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    email,
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
                                    phone,
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
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Text(
                                    aboutMe,
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
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    address,
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
                                  postcode,
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
                   await EasyLoading.show(
                      status: 'Mise à jour des informations');
                  setState(() {
                    UserInfos.info['name'] = name;
                    UserInfos.info['first_name'] = firstName;
                    UserInfos.info['pseudo'] = pseudo;
                    UserInfos.info['email'] = email;
                    UserInfos.info['phone'] = phone;
                    UserInfos.info['address'] = address;
                    UserInfos.info['postcode'] = postcode;
                    UserInfos.info['about_me'] = aboutMe;
                  });
                  var response = await http.post(
                      Uri.parse(
                          "https://api.trocbuy.fr/flutter/duo_update_profil.php"),
                      body: UserInfos.info);

                  if (jsonDecode(response.body)['resultat'] == true) {
                    await EasyLoading.showSuccess('valide',
                        duration: const Duration(seconds: 5));
                    //  await EasyLoading.dismiss();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  } else {
                    EasyLoading.showError('Verfier votre information',
                        duration: const Duration(seconds: 3));
                    await EasyLoading.dismiss();
                    Navigator.of(context).pop();
                  }

                  //  EasyLoading.dismiss();
                },
                color: Colors.green,
              ),
              /*// Button
                Container(
                  child: FlatButton(
                    onPressed: handleUpdateData,
                    child: Text(
                      'ENREGISTRER',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    color: primaryColor,
                    highlightColor: Color(0xff8d93a0),
                    splashColor: Colors.transparent,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  ),
                  margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                ),*/
            ],
          ),
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        ),

        /*       // Loading
        Positioned(
          child: isLoading
              ? Container(
                  child: const Center(
                    child: CircularProgressIndicator(
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Styles.principalColor)),
                  ),
                  color: Colors.white.withOpacity(0.8),
                )
              : SizedBox.shrink(),
        ),*/
      ],
    );
  }
}
