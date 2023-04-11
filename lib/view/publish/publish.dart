import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Publish extends StatefulWidget {
  @override
  _PublishState createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  Future<File>? file;
  String status = '';
  late String base64Image;
  late File tmpFile;
  String error = 'Error';

  chooseImage() {
    setState(() {
      // ignore: deprecated_member_use
      file =
          ImagePicker().pickImage(source: ImageSource.gallery) as Future<File>;
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  uploadImg() {
    if (null == tmpFile) {
      setStatus(error);
      return;
    }

    String fileName = tmpFile.path.split('/').last;

    upload(fileName);
  }

  upload(String fileName) {
    http.post(Uri.parse('https://api.trocbuy.fr/flutter/php/photo_upload.php'),
        body: {
          "image": base64Image,
          "name": fileName,
        }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : error);
    }).catchError((error) {
      setStatus((error));
    });
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image/Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<File>(
              future: file,
              builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    null != snapshot.data) {
                  tmpFile = snapshot.data!;
                  base64Image = base64Encode(snapshot.data!.readAsBytesSync());
                  return Container(
                    margin: const EdgeInsets.all(15),
                    child: Material(
                      elevation: 3.0,
                      child: Image.file(
                        snapshot.data!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                } else if (null != snapshot.error) {
                  return const Text(
                    'Error!',
                    textAlign: TextAlign.center,
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.all(15),
                    child: Material(
                      elevation: 3.0,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.asset('assets/placeholder-image.png'),
                          InkWell(
                            onTap: () {
                              chooseImage();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10.0, right: 10.0),
                              child: Icon(
                                Icons.edit,
                                size: 30.0,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50.0,
              width: 360.0,
              child: ElevatedButton(
                child: const Text(
                  'Upload Image',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  uploadImg();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
