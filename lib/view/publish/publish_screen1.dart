import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../model/region.dart';
import '../../providers/publish_provider.dart';
import '../components/app_bar/default_app_bar.dart';

import '../../res/styles.dart';
import '../components/button_create.dart';
import 'publish_screen2.dart';

class PublishScreen1 extends StatefulWidget {
  @override
  _PublishScreen1State createState() => _PublishScreen1State();
}

class _PublishScreen1State extends State<PublishScreen1> {
  final picker = ImagePicker();
  String? dir, newPaths, date;
  List<ImageSource> values = [];
  File? file;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> showAlertDialogDelete(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Styles.principalColor,
          title: const Text(
            'Vous déposez sans photos ?',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Sachez qu\'une annonce avec photos multiplie cos chances de vendre plus rapidement',
            style: TextStyle(
                color: Colors.white, fontSize: 18.0, fontFamily: 'ytv'),
          ),
          actions: [
            // ignore: deprecated_member_use
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(224, 255, 255, 1),
                    ),
                    child: const Text("Ajoutez des photos",
                        style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      getImage(
                        context,
                        index: 0,
                      );
                    }),
                const SizedBox(
                  width: 10,
                ),

                // ignore: deprecated_member_use
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 206, 209, 1),
                  ),
                  child: const Text(
                    "Continuer sans photos",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Provider.of<PublishProvider>(context, listen: false)
                        .updatePictureNumber();
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (BuildContext context) => PublishScreen2(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> getImage(BuildContext context, {int? index}) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        void addImagePickerThenFunction(value) {
          if (Provider.of<PublishProvider>(context, listen: false)
                      .pictureNumber <=
                  10 &&
              Provider.of<PublishProvider>(context, listen: false)
                      .imagePath[index!] ==
                  '') {
            Provider.of<PublishProvider>(context, listen: false)
                .changeImagePath(value, index);

            Provider.of<PublishProvider>(context, listen: false)
                .changeImageName(value, index);

            Provider.of<PublishProvider>(context, listen: false)
                .changeImageBase64(
                    base64Encode(File(value.path).readAsBytesSync()), index);

            Provider.of<PublishProvider>(context, listen: false)
                .addNewPathEmpty();

            Provider.of<PublishProvider>(context, listen: false)
                .addNewImageBase64Empty();
            Provider.of<PublishProvider>(context, listen: false)
                .addNewImageNameEmpty();

            Provider.of<PublishProvider>(context, listen: false)
                .updatePictureNumber();
          } else if (Provider.of<PublishProvider>(context, listen: false)
                  .imagePath[index!] !=
              '') {
            Provider.of<PublishProvider>(context, listen: false)
                .changeImagePath(value, index);
            Provider.of<PublishProvider>(context, listen: false)
                .changeImageName(value, index);

            Provider.of<PublishProvider>(context, listen: false)
                .changeImageBase64(
                    base64Encode(File(value.path).readAsBytesSync()), index);
          } else {
            Fluttertoast.showToast(
                msg: "Désolé, une erreur inattendue s'est produite");
          }
          // Navigator.pop(context);
        }

        return AlertDialog(
          title: const Text('Choose an action'),
          content: Container(
            height: 100.0,
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    // Navigator.pop(context);
                    PickedFile pickedFile;
                    // ignore: deprecated_member_use
                    await ImagePicker()
                        .pickImage(
                          source: ImageSource.camera,
                        )
                        .then(
                          addImagePickerThenFunction,
                        );
                  },
                  icon: const Icon(Icons.camera_alt_outlined,
                      color: Styles.principalColor),
                  label: const Text(
                    'Take a picture',
                    style: TextStyle(color: Styles.principalColor),
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    // Navigator.pop(context);
                    PickedFile pickedFile;
                    // ignore: deprecated_member_use
                    await ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then(addImagePickerThenFunction);
                  },
                  icon: const Icon(
                    Icons.photo_library_outlined,
                    color: Styles.principalColor,
                  ),
                  label: const Text(
                    'Access the gallery',
                    style: TextStyle(color: Styles.principalColor),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel_outlined,
                color: Styles.principalColor,
              ),
              label: const Text(
                'Cancel',
                style: TextStyle(color: Styles.principalColor),
              ),
            ),
          ],
        );
      },
    );
  }

  // Future<void> getImage(BuildContext cxt, {int? index}) async {
  //   return showDialog(
  //     context: cxt,
  //     barrierDismissible: true,
  //     builder: (_) {
  //       void addImagePickerThenFunction(value) {
  //         if (Provider.of<PublishProvider>(context, listen: false)
  //                     .pictureNumber <=
  //                 10 &&
  //             Provider.of<PublishProvider>(context, listen: false)
  //                     .imagePath[index!] ==
  //                 '') {
  //           Provider.of<PublishProvider>(context, listen: false)
  //               .changeImagePath(value, index);

  //           Provider.of<PublishProvider>(context, listen: false)
  //               .changeImageName(value, index);

  //           Provider.of<PublishProvider>(context, listen: false)
  //               .changeImageBase64(
  //                   base64Encode(File(value.path).readAsBytesSync()), index);

  //           Provider.of<PublishProvider>(context, listen: false)
  //               .addNewPathEmpty();

  //           Provider.of<PublishProvider>(context, listen: false)
  //               .addNewImageBase64Empty();
  //           Provider.of<PublishProvider>(context, listen: false)
  //               .addNewImageNameEmpty();

  //           Provider.of<PublishProvider>(context, listen: false)
  //               .updatePictureNumber();
  //         } else if (Provider.of<PublishProvider>(context, listen: false)
  //                 .imagePath[index!] !=
  //             '') {
  //           Provider.of<PublishProvider>(context, listen: false)
  //               .changeImagePath(value, index);
  //           Provider.of<PublishProvider>(context, listen: false)
  //               .changeImageName(value, index);

  //           Provider.of<PublishProvider>(context, listen: false)
  //               .changeImageBase64(
  //                   base64Encode(File(value.path).readAsBytesSync()), index);
  //         } else {
  //           Fluttertoast.showToast(
  //               msg: "Désolé, une erreur inattendue s'est produite");
  //         }
  //         Navigator.pop(cxt);
  //       }

  //       return AlertDialog(
  //         title: const Text('Choose an action'),
  //         content: Container(
  //           height: 100.0,
  //           padding: const EdgeInsets.only(left: 15),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TextButton.icon(
  //                 onPressed: () async {
  //                   // Navigator.pop(context);
  //                   PickedFile pickedFile;
  //                   // ignore: deprecated_member_use
  //                   await ImagePicker()
  //                       .pickImage(
  //                         source: ImageSource.camera,
  //                       )
  //                       .then(
  //                         addImagePickerThenFunction,
  //                       );
  //                 },
  //                 icon: const Icon(Icons.camera_alt_outlined,
  //                     color: Styles.principalColor),
  //                 label: const Text(
  //                   'Take a picture',
  //                   style: TextStyle(color: Styles.principalColor),
  //                 ),
  //               ),
  //               TextButton.icon(
  //                 onPressed: () async {
  //                   // Navigator.pop(context);
  //                   PickedFile pickedFile;
  //                   // ignore: deprecated_member_use
  //                   await ImagePicker()
  //                       .pickImage(source: ImageSource.gallery)
  //                       .then(addImagePickerThenFunction);
  //                 },
  //                 icon: const Icon(
  //                   Icons.photo_library_outlined,
  //                   color: Styles.principalColor,
  //                 ),
  //                 label: const Text(
  //                   'Access the gallery',
  //                   style: TextStyle(color: Styles.principalColor),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton.icon(
  //             onPressed: () {
  //               Navigator.pop(cxt);
  //             },
  //             icon: const Icon(
  //               Icons.cancel_outlined,
  //               color: Styles.principalColor,
  //             ),
  //             label: const Text(
  //               'Cancel',
  //               style: TextStyle(color: Styles.principalColor),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Photos'),
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6.0),
                width: MediaQuery.of(context).size.width,
                color: Styles.principalColor,
                child: const Text(
                  'Les photos donnent plus de visibilité à votre annonce,'
                  ' et vous permettront de vendre beaucoup plus rapidement',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontSize: 14.0, fontFamily: 'ytv'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Text(
                  "Vos photos :",
                ),
              ),
              buildPaddingDescription(),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 270,
                child: ListView.builder(
                  //physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Provider.of<PublishProvider>(context)
                              .pictureNumber ==
                          0
                      ? 1
                      : Provider.of<PublishProvider>(context).pictureNumber + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          width: 150.0,
                          height: 250.0,
                          child: Provider.of<PublishProvider>(context)
                                      .pictureNumber <
                                  10
                              ? GestureDetector(
                                  onTap: () {
                                    getImage(
                                      context,
                                      index: index,
                                    );
                                  },
                                  child: Container(
                                    child: Provider.of<PublishProvider>(context)
                                                    .imagePath[index] ==
                                                '' ||
                                            Provider.of<PublishProvider>(
                                                    context)
                                                .imagePath
                                                .isEmpty
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 85, horizontal: 30),
                                            color: Colors.grey[300],
                                            child: Container(
                                              child: const Icon(
                                                Icons.add_a_photo_outlined,
                                                size: 62,
                                              ),
                                              color: Colors.grey[400],
                                            ))
                                        : Image.file(
                                            File(Provider.of<PublishProvider>(
                                                    context)
                                                .imagePath[index]),
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                )
                              : Image.file(
                                  File(Provider.of<PublishProvider>(context)
                                      .imagePath[index]),
                                  fit: BoxFit.fill,
                                ),
                        ),
                        Provider.of<PublishProvider>(context)
                                        .imagePath[index] ==
                                    '' ||
                                Provider.of<PublishProvider>(context)
                                        .imagePath[index]
                                        .isEmpty &&
                                    Provider.of<PublishProvider>(context)
                                            .pictureNumber <
                                        10
                            ? const SizedBox(
                                height: 0,
                              )
                            : Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.red,
                                    size: 28,
                                  ),
                                  splashRadius: 15,
                                  onPressed: () {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .removeImagePath(index);
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .removeImageName(index);
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .removeImageBase64(index);
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .updatePictureNumber();
                                  },
                                ),
                              ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
                      title: 'Suivant',
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      minWidth: 150,
                      onPressed: () async {
                        Provider.of<PublishProvider>(context, listen: false)
                            .updatePictureNumber();

                        Fluttertoast.showToast(msg: "Images bien enregistrée");
                        if (Provider.of<PublishProvider>(context, listen: false)
                                .pictureNumber ==
                            0) {
                          showAlertDialogDelete(context);
                        } else {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  PublishScreen2(),
                            ),
                          );
                        }
                      },
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
          //SizedBox(height: 20,)
        ],
      ),
    );
  }

  Padding buildPaddingDescription() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Vous pouvez télécharger 10 photo(s) GRATUITEMENT",
              softWrap: true,
            ),
            Text(
              "+ 5 dans le pack payant En fonction de la taille de vos images, ",
              softWrap: true,
            ),
            Text(
              "Selon la taille de vos images, le téléchargement peut prendre plusieurs minutes.",
              softWrap: true,
            ),
          ],
        ));
  }
}
