import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../providers/selected_ad.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../components/app_bar/default_app_bar.dart';

import '../../model/ad.dart';
import '../../model/user_infos.dart';
import '../components/title_item.dart';
import '../message/component/message_stream2.dart';
import 'components/envUrl.dart';

class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Ad? ad = context.read<SelectedAd>().ad;
    String pseudo;
    String title;
    String text;
    String email;
    int rating = 0;
    DateTime date;
    String ip;
    String state;

    Future addComment() async {
      try {
        await http
            .post(Uri.parse("${Env.URL_PREFIX}/add_new_comment.php"), body: {
          "id_ad": "${ad?.idAd}",
          "pseudo": "${ad?.name}",
          "title": "${ad?.title}",
          "text": "${ad?.text}",
          "email": "${ad?.email}",
          "rating": "$rating",
          "date": "1615329885",
          "state": "2",
          "ip": "192.168.0.1"
        });
      } catch (e) {}
    }

    bool show = false;
    return Container(
      color: Styles.principalColor,
      child: SafeArea(
        child: Scaffold(
          appBar: DefaultAppBar(
            title: Strings.kComments,
          ),
          body: Form(
            key: _formKey,
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    MessageStream2(
                      id: ad!.idAd.toString(),
                    ),
                    //AFFICHE LES COMMENTAIRES
                    Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'Voir les commentaires',
                                style: TextStyle(color: Colors.orange),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: Colors.orange,
                              )
                            ],
                          ),
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Material(
                                  color: Styles.principalColor.withOpacity(.4),
                                  child: CupertinoActionSheet(
                                    message: MyCommentsWidget(
                                      idAd: ad.idAd.toString(),
                                    ),
                                    actions: [
                                      CupertinoActionSheetAction(
                                        child: const Text(
                                          'Revenir',
                                          style: TextStyle(
                                              color: Colors.deepOrange),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        )),
                    //ETOILES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Votre note:'),
                        SmoothStarRating(
                            color: Colors.orange,
                            borderColor: Colors.green,
                            allowHalfRating: false,
                            starCount: 5,
                            onRatingChanged: (value) {
                              setState(() {
                                rating = value.toInt();
                              });
                            }),
                      ],
                    ),
                    //NAME
                    const TitleItem(title: 'Votre nom'), // votre nom
                    TextF(
                        validationCallBack: (value) {
                          if (value.toString().isEmpty) {
                            return 'Votre nom';
                          }
                          return null;
                        },
                        callBack: (newValue) {
                          setState(() {
                            pseudo = newValue;
                          });
                        },
                        initialValue: UserInfos.info["name"] ?? '',
                        keyboardType: TextInputType.text),

                    //EMAIL
                    const TitleItem(title: 'Votre email'),
                    TextF(
                        initialValue: UserInfos.info["email"] ?? '',
                        callBack: (newValue) {
                          setState(() {
                            email = newValue;
                          });
                        },
                        validationCallBack: (String? value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Adresse email invalide!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress),
                    //TITRE
                    const TitleItem(title: 'Titre '),
                    TextF(
                        initialValue: '',
                        callBack: (newValue) {
                          setState(() {
                            title = newValue;
                          });
                        },
                        validationCallBack: (String? value) {
                          if (value!.isEmpty) {
                            return 'Ajoutez du titre';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress),
                    //COMMENT TEXT
                    const TitleItem(title: 'Votre commentaire'),
                    TextF(
                      initialValue: '',
                      validationCallBack: (String? value) {
                        if (value!.isEmpty) {
                          return 'Votre commentaire';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      maxline: 2,
                      callBack: (newValue) {
                        setState(() {
                          text = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    //SUBMIT
                    Valider(
                      function: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            show = true;
                          });
                          await addComment().then(
                            (value) {
                              Fluttertoast.showToast(
                                  msg: "Commentaire publié",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Styles.principalColor,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                pseudo = '';
                                email = '';
                                title = '';
                                text = '';
                                show = false;
                              });
                            },
                            onError: (error) {
                              setState(
                                () {
                                  show = false;
                                },
                              );
                            },
                          );
                          //Navigator.pushNamed(context, HomeScreen2.id);
                        }
                      },
                    )
                  ],
                ),
                Center(
                    child: Visibility(
                        visible: show,
                        child: const CircularProgressIndicator()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCommentsWidget extends StatefulWidget {
  const MyCommentsWidget({
    Key? key,
    @required this.idAd,
  }) : super(key: key);

  final String? idAd;

  @override
  _MyCommentsWidgetState createState() => _MyCommentsWidgetState();
}

class _MyCommentsWidgetState extends State<MyCommentsWidget> {
  List<MyComment> myComments = [];
  Future<List<MyComment>> getComments(String idAd) async {
    String url =
        'https://api.trocbuy.fr/flutter/commentaires/comments.php?id_ad=$idAd';
    var response = await http.get(Uri.parse(url));
    var jsonResp = json.decode(response.body);
    myComments.clear();
    for (var comment in jsonResp) {
      myComments.add(MyComment(
          pseudo: comment['pseudo'],
          text: comment['text'],
          email: comment['email'],
          ip: comment['ip'],
          rating: comment['rating'],
          state: comment['rate'],
          title: comment['title'],
          date: comment['date']));
      setState(() {});
    }
    return myComments;
  }

  @override
  Widget build(BuildContext context) {
    final Ad? ad = context.read<SelectedAd>().ad;
    getComments(ad!.idAd.toString());
    return myComments.isEmpty
        ? Container(
            child: const Center(
              child: Text('Aucun commentaire pour le moment.'),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 50 / 100,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return StreamBuilder(
                  stream: getComments(ad.idAd.toString()).asStream(),
                  builder: (context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Text(snapshot.data?.rating);
                      case ConnectionState.active:
                        return const SizedBox.shrink();

                      case ConnectionState.done:
                        return ListTile(
                          leading: snapshot.data.rating != 0
                              ? SmoothStarRating(
                                  color: Colors.orange,
                                  borderColor: Colors.deepOrange,
                                  starCount: myComments[0].rating!,
                                  //isReadOnly: true,
                                )
                              : const SizedBox.shrink(),
                          title: AutoSizeText(snapshot.data.pseudo),
                          subtitle: AutoSizeText(
                            snapshot.data.text,
                            maxLines: 5,
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {},
                          ),
                        );
                    }

                    return const Text('');
                  },
                );
              },
            ),
          );
  }
}

class MyComment {
  final String? pseudo;
  final String? title;
  final String? text;
  final String? email;
  final int? rating;
  final int? date;
  final String? ip;
  final int? state;

  MyComment(
      {this.pseudo,
      this.title,
      this.text,
      this.email,
      this.rating,
      this.date,
      this.ip,
      this.state});
}
