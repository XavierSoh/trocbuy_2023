import 'package:flutter/material.dart';
import '../../res/styles.dart';

import '../components/button_create.dart';
import '../home/home.dart';

class FavoriteAccountScreen extends StatefulWidget {
  const FavoriteAccountScreen({Key? key}) : super(key: key);

  @override
  _FavoriteAccountScreenState createState() => _FavoriteAccountScreenState();
}

class _FavoriteAccountScreenState extends State<FavoriteAccountScreen> {
  @override
  build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Styles.principalColor,
            title: const Text('Mes Favoris'),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(
                text: "Mes annonces de coeur",
              ),
              Tab(
                text: "Mes recherches",
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 0.0,
                  ),
                  const Text(
                    'Acune recherche pour le moment',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      ButtonCreate(
                        title: 'Créer une nouvelle recherche',
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        minWidth: 150,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        },
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    ));
  }
}
