import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/app_bar/default_app_bar.dart';

import '../../model/Categories/switch_subcats_options.dart';
import '../../providers/publish_provider.dart';
import '../../res/styles.dart';
import '../components/button_create.dart';
import 'publish_screen1.dart';

class PublishScreen01 extends StatefulWidget {
  @override
  _PublishScreen01State createState() => _PublishScreen01State();
}

class _PublishScreen01State extends State<PublishScreen01> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Déposer une annonce'),
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(
            top: 20, bottom: MediaQuery.of(context).padding.bottom),
        child: SingleChildScrollView(
          child: Form(
            key: Provider.of<PublishProvider>(context).formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SwitchSubCatsOptions(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonCreate(
                              title: 'Precedent',
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              minWidth: 150,
                              onPressed: () {
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .moreInfo
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .kmController
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .kmControllerVoiture
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .pointureController
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .date1erController
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .dateController
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .puissanceController
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .tailleController
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .ageController
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .surfaceController
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .cauchageController
                                    .clear();
                                Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .voitureModelController
                                    .clear();

                                Navigator.of(context).pop();
                              },
                              color: Styles.principalColor,
                            ),
                            ButtonCreate(
                              title: 'Suivant',
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              minWidth: 150,
                              onPressed: () {
                                if (Provider.of<PublishProvider>(context,
                                        listen: false)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .kmController
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                      '33',
                                      Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .kmController
                                          .text,
                                    );
                                  }
                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .kmControllerVoiture
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                      '2',
                                      Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .kmControllerVoiture
                                          .text,
                                    );
                                  }

                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .pointureController
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                      '50',
                                      Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .pointureController
                                          .text,
                                    );
                                  }
                                  // a regarder
                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .dateController
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                            Provider.of<PublishProvider>(
                                                    context,
                                                    listen: false)
                                                .dateController
                                                .text,
                                            '97');
                                  }
                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .puissanceController
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                      '15',
                                      Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .puissanceController
                                          .text,
                                    );
                                  }
                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .tailleController
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                            '21',
                                            Provider.of<PublishProvider>(
                                                    context,
                                                    listen: false)
                                                .tailleController
                                                .text);
                                  }
                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .ageController
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                      '92',
                                      Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .ageController
                                          .text,
                                    );
                                  }

                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .surfaceController
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                            '58',
                                            Provider.of<PublishProvider>(
                                                    context,
                                                    listen: false)
                                                .surfaceController
                                                .text);
                                  }
                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .voitureModelController
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                            '2',
                                            Provider.of<PublishProvider>(
                                                    context,
                                                    listen: false)
                                                .voitureModelController
                                                .text);
                                  }
                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .date1erController
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                            '13',
                                            Provider.of<PublishProvider>(
                                                    context,
                                                    listen: false)
                                                .date1erController
                                                .text);
                                  }
                                  if (Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .cauchageController
                                          .text !=
                                      '') {
                                    Provider.of<PublishProvider>(context,
                                            listen: false)
                                        .addToMoreInfoMap(
                                      '12',
                                      Provider.of<PublishProvider>(context,
                                              listen: false)
                                          .cauchageController
                                          .text,
                                    );
                                  }

                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .kmController
                                      .clear();
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .kmControllerVoiture
                                      .clear();
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .pointureController
                                      .clear();
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .date1erController
                                      .clear();
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .dateController
                                      .clear();
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .puissanceController
                                      .clear();
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .tailleController
                                      .clear();
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .ageController
                                      .clear();
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .surfaceController
                                      .clear();
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .cauchageController
                                      .clear();
                                  Provider.of<PublishProvider>(context,
                                          listen: false)
                                      .voitureModelController
                                      .clear();

                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              PublishScreen1()));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
